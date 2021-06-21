import 'package:flutter/material.dart';
import 'package:sqliteapp/components/drawerS.dart';
import '../models/user.dart';
import '../models/transaction.dart';
import 'package:sqliteapp/components/alertD.dart';
import 'package:sqliteapp/components/randomNo.dart';
import 'package:sqliteapp/database/money_database.dart';

class viewTransactions extends StatefulWidget {
  viewTransactions({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  _viewTransactionsState createState() => _viewTransactionsState();
}

int accountV = 0;
class _viewTransactionsState extends State<viewTransactions> {
  final formKey = GlobalKey<FormState>(); //as we'll make our code a form

  int? _id;
  int? accountId;
  TextEditingController _accountId = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _amount = TextEditingController();
  DateTime? date;
  int? convertedDate;



  Future<List<Transactions>>? _listFuture;


   @override
  void initState() {
    super.initState();
    // initial load
    _listFuture = MoneyDatabase.instance.getUsersTransactions();
  }

  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Sidebar(this.widget.user),
      backgroundColor: Colors.white,
       appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            backgroundColor: Color(0xFF6F35A5),
            title: Text("Transactions"),
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
                  "Make Transactions",
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
                      validator: (value)  {
                        int len = value!.length;
                        
                        if (len == 0) {
                          return "`AccountId` cannot be empty";
                        } else if (accountV  < 1) {
                          return "`AccountId` is not valid";
                        }
                        return null;
                      },
                      controller: _accountId,
                      onChanged: (value) {
                        validateA(value);
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(26)),
                        ),
                        hintText: 'AccountId',
                        filled: true,
                        fillColor: Color(0xFFF1E6FF),
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        prefixIcon:
                            Icon(Icons.account_box, color: Color(0xFF6F35A5)),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: screenSize.width * 0.8,
                  child: ListTile(
                    title: TextFormField(
                      validator: (value)  {
                        int len = value!.length;
                        if (len == 0) {
                          return "`description` cannot be empty";
                        } else if (len < 10) {
                          return "`description` length atleat 10";
                        }
                        return null;
                      },
                      controller: _description,
                      
                     // maxLines: 4,
                      decoration: InputDecoration(
                      
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(26)),
                        ),
                        hintText: 'description',
                        filled: true,
                        
                        fillColor: Color(0xFFF1E6FF),
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        prefixIcon:
                            Icon(Icons.book, color: Color(0xFF6F35A5)),
                      ),
                    ),
                  ),
                ),

                 Container(
                  width: screenSize.width * 0.8,
                  child: ListTile(
                    title: TextFormField(
                      validator: (value)  {
                        int len = value!.length;
                        if (len == 0) {
                          return "`amount` cannot be empty";
                        } 
                        return null;
                      },
                      controller: _amount,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(26)),
                        ),
                        hintText: 'Amount',
                        filled: true,
                        fillColor: Color(0xFFF1E6FF),
                        hintStyle: TextStyle(color: Colors.grey[700]),
                        prefixIcon:
                            Icon(Icons.money, color: Color(0xFF6F35A5)),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      if (this.formKey.currentState!.validate()) {
                        // if(accountFlag == 1){
                          print("validated");
                            _id = randomId(1111, 3333);
                            
                            date = DateTime.now();
                            
                            
                            convertedDate = date!.millisecondsSinceEpoch;
                           // DateTime n =  DateTime.fromMillisecondsSinceEpoch(date!.millisecondsSinceEpoch);

                            //check account type
                           String accountType = await MoneyDatabase.instance.getSingleAccount(_accountId.text);
                           int? accId;
                           print("here type");
                           print(accountType);
                            try {
                              accId = int.parse(_accountId.text);
                              
                            } on FormatException {
                              print("Exception occured");
                            }
                           
     
                            var transaction = accountType == 'Expense'? Transactions(
                              id: _id!,
                              accountId: accId!,
                              userId: this.widget.user!.id,
                              description: _description.text,
                              drAmount: _amount.text!,
                              transactionDate: convertedDate!,
                              type: accountType,
                            ) : Transactions(
                              id: _id!,
                              accountId: accId!,
                              userId: this.widget.user!.id,
                              description: _description.text,
                              drAmount:  _amount.text!,
                              transactionDate: convertedDate!,
                              type: accountType,
                              );
                           
                           
                            int response = await MoneyDatabase.instance.insertTransaction(transaction);

                              if (response == 1) {
                                String msg = "Transaction made successfully to this Account " + _accountId.text;
                                var response = await MoneyDatabase.instance.getUsersTransactions();
                                
                              
                                showAlertDialog(context, msg);
                                setState(() {
                                  _listFuture = MoneyDatabase.instance.getUsersTransactions();
                                });
                              } else {
                                showAlertDialog(context, "Transaction was not added");
                              }
                      }else{
                        print("not validated");
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: screenSize.width * 0.19,
                      padding: EdgeInsets.fromLTRB(1, 16, 1, 16),
                      child:  Text("Date", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: screenSize.width * 0.19,
                      padding: EdgeInsets.fromLTRB(1, 16, 1, 16),
                      child:  Text("Description",  style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: screenSize.width * 0.19,
                      padding: EdgeInsets.fromLTRB(1, 16, 1, 16),
                      child: Text("Amount",  style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: screenSize.width * 0.19,
                      padding: EdgeInsets.fromLTRB(1, 16, 1, 16),
                      child:  Text("Type",  style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                 
                  ],
                ),

                
                ListView(shrinkWrap: true, children: [
                  FutureBuilder(
                    future: _listFuture,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Transactions>> snapshot) {
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
                              key: ValueKey<int>(
                                  snapshot.data![index].id),
                              onDismissed: (DismissDirection direction) async {
                                await MoneyDatabase.instance.deleteTransaction(
                                    snapshot.data![index].id);
                                setState(() {
                                  snapshot.data!.remove(snapshot.data![index]);
                                });
                              },
                              child: Container(
                                width: screenSize.width,
                                child: GestureDetector(
                                  //to show values on text box
                                  onDoubleTap: () {
                                    setState(() {
                                      _accountId.text = snapshot.data![index].accountId.toString();
                                    });
                                  },
                                  child: Card(
                                    color: Color(0xFFF1E6FF),
                                    shadowColor: Color(0xFF6F35A5),
                                    child: ListTile(
                                        title: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                            // padding: EdgeInsets.all(16),
                                            padding: EdgeInsets.fromLTRB(
                                                1, 16, 1, 16),
                                            width: screenSize.width * 0.19,
                                            
                                            child: Text((DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].transactionDate)).toString())
                                        ),
                                            //Text(snapshot.data![index].id.toString())),
                                        Container(
                                            //  padding: EdgeInsets.all(16),
                                            padding: EdgeInsets.fromLTRB(
                                                1, 16, 1, 16),
                                            width: screenSize.width * 0.19,
                                            child: Text(
                                                snapshot.data![index].description)),
                                        Container(
                                            // padding: EdgeInsets.all(16),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 16, 0, 16),
                                            width: screenSize.width * 0.19,
                                            child: Text(
                                                snapshot.data![index].drAmount.toString())),
                                         Container(
                                            // padding: EdgeInsets.all(16),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 16, 0, 16),
                                            width: screenSize.width * 0.19,
                                            child: Text(
                                                snapshot.data![index].type.toString())),
                                        Container(
                                            // padding: EdgeInsets.all(16),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 16, 0, 16),
                                            width: screenSize.width * 0.1,
                                            child: IconButton(
                                              icon: Icon(Icons.edit),
                                              onPressed: () async {
                                                //update
                                                // var account = Transactions(
                                                //   id: snapshot
                                                //       .data![index].id,
                                                //   title: _title.text,
                                                //   type: type!,
                                                // );

                                                // int res = await MoneyDatabase
                                                //     .instance
                                                //     .updateAccount(account);
                                                // setState(() {
                                                //   _listFuture = MoneyDatabase
                                                //       .instance
                                                //       .getAllAccounts();
                                                // });
                                                // if (res == 1) {
                                                //   showAlertDialog(context,
                                                //       "User Updated Succssfulyy");
                                                // }
                                              },
                                              color: Color(0xFF6F35A5),
                                            )),
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),

    );
  }
}


void validateA(String value) async {
  accountV =  await MoneyDatabase.instance.validateAccount(value);
  print(accountV);
  print(accountV);
}