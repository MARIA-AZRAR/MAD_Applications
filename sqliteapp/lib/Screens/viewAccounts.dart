import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqliteapp/components/alertD.dart';
import 'package:sqliteapp/components/randomNo.dart';
import 'package:sqliteapp/database/money_database.dart';
import 'package:sqliteapp/models/account.dart';
import '../models/user.dart';

class viewAccounts extends StatefulWidget {
  viewAccounts({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _viewAccountsState createState() => _viewAccountsState();
}

class _viewAccountsState extends State<viewAccounts> {

  final formKey = GlobalKey<FormState>();  //as we'll make our code a form

  Accounts? createdAccount;
  int? _id;
  
  TextEditingController _title = TextEditingController();
  String? type = 'Expense';

  List<String>? typeList = ['Expense', 'Revenue'];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            backgroundColor: Color(0xFF6F35A5),
            title: Text("Accounts"),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.03),
              Text(
                "Add Account",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              SizedBox(height: screenSize.height * 0.03),
              Container(
                width: screenSize.width * 0.8,
                child: ListTile(
                  title: TextFormField(
                    validator: (value) {
                        int len = value!.length;
                        if (len == 0) {
                          return "`name` cannot be empty";
                        } else if (len < 4) {
                          return "`name` must be longer than 3 characters";
                        }
                        return null;
                      },
                   controller: _title,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                      ),
                      hintText: 'Title',
                      filled: true,
                      fillColor: Color(0xFFF1E6FF),
                      hintStyle: TextStyle(color: Colors.grey[700]),
                      prefixIcon: Icon(Icons.account_box, color: Color(0xFF6F35A5)),
                    ),
                  ),
                ),
              ),

              Container(
                width: screenSize.width * 0.75,

                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color(0xFFF1E6FF),
            ),
                child:  ListTile(
                title: DropdownButton<String>(
                    value: type,
                    iconEnabledColor: Color(0xFFF1E6FF),
                    dropdownColor: Color(0xFFF1E6FF),
                    elevation: 5,
                    style: TextStyle(color: Colors.grey[700]),
                    onChanged: (val) {
                      setState(() {
                        type = val;
                      });
                    },
                    items:
                        typeList!.map<DropdownMenuItem<String>>((String val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(val),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Please select account type",
                      style: TextStyle(
                          fontSize: 16, height: 2, color: Colors.grey[700]),
                    ),
                  ),
                  
              ),
              ),

              SizedBox(height: screenSize.height * 0.03),

              Container(
                width: screenSize.width * 0.5,
                child: ListTile(
                    title: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF6F35A5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide.none))),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "ADD",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                   onPressed: () async {
                     if(this.formKey.currentState!.validate()){
                        _id = randomId(111111, 333333);

                     var account = Accounts(
                        accountId: _id!,
                        title: _title.text!,
                        type: type!,
                      );

                      print(account);
                     int response =  await MoneyDatabase.instance.insertAccount(account);
                    
                      if (response == 1) {
                        String msg = "Account added successfully. Here is your AccountID: " + _id.toString() ;
                        showAlertDialog(context, msg);
                      } else {
                        showAlertDialog(context, "User was not added");
                      }
                     }else{
                       showAlertDialog(context, "User not validated");
                     }
                  },
                )),
              ),

               SizedBox(height: screenSize.height * 0.03),
              Text(
                "Accounts",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
               SizedBox(height: screenSize.height * 0.03),

              FutureBuilder(
                future: MoneyDatabase.instance.getAllAccounts(),
                builder: (BuildContext context, AsyncSnapshot<List<Accounts>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                     return Dismissible(
                     direction: DismissDirection.endToStart,
                     background: Container(
                      color: Colors.red[900],
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                     child: Icon(Icons.delete_forever),
                    ),
                   key: ValueKey<int>(snapshot.data![index].accountId!),
                   onDismissed: (DismissDirection direction) async {
                    await MoneyDatabase.instance.deleteUser(snapshot.data![index].accountId!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  
                  child: Container(
                      width: screenSize.width,
                      child: Card(
                        color: Color(0xFFF1E6FF),
                        shadowColor: Color(0xFF6F35A5),
                        child: ListTile(
                          title: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  // padding: EdgeInsets.all(16),
                                  padding: EdgeInsets.fromLTRB(1, 16, 1, 16),
                                  width: screenSize.width * 0.24,
                                  child: Text(snapshot.data![index].accountId.toString())),
                              Container(
                                  //  padding: EdgeInsets.all(16),
                                  padding: EdgeInsets.fromLTRB(1, 16, 1, 16),
                                  width: screenSize.width * 0.24,
                                  child: Text(snapshot.data![index].title)),
                              Container(
                                  // padding: EdgeInsets.all(16),
                                  padding: EdgeInsets.fromLTRB(19, 16, 0, 16),
                                  width: screenSize.width * 0.24,
                                  child: Text(snapshot.data![index].type)),
                              Container(
                                  // padding: EdgeInsets.all(16),
                                  padding: EdgeInsets.fromLTRB(19, 16, 0, 16),
                                  width: screenSize.width * 0.1,
                                  child: IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {},
                                  color: Color(0xFF6F35A5),
                                )),
                            ],
                          )
                  
                        ),
                      ),
                  ),
                  
                  // Card(
                  //     child: ListTile(
                  //   contentPadding: EdgeInsets.all(8.0),
                  //   title: Text(snapshot.data![index].title),
                  //   subtitle: Text(snapshot.data![index].type.toString()),
                  // )),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),


            ],
          ),
        ),
      ),
      ),
    );
  }
}
