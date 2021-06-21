import 'package:flutter/material.dart';
import 'package:sqliteapp/database/money_database.dart';
import '../components/drawerS.dart';
import '../models/user.dart';
import '../models/transaction.dart';

class viewReports extends StatefulWidget {
  viewReports({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _viewReportsState createState() => _viewReportsState();
}

class _viewReportsState extends State<viewReports> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        drawer: Sidebar(this.widget.user),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0), // here the desired height
          child: AppBar(
              backgroundColor: Color(0xFF6F35A5),
              title: Text("Reports"),
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(
                    Icons.money_off,
                  ),
                  text: "Expense",
                ),
                Tab(
                  icon: Icon(Icons.money),
                  text: "Revenue",
                ),
                Tab(
                  icon: Icon(Icons.attach_money),
                  text: "Both",
                ),
              ])),
        ),
        body: TabBarView(
          children: [
            expense(user: this.widget.user),
            Text("Revenue"),
            Text("both"),
          ],
        ),
      ),
    );
  }
}

class expense extends StatefulWidget {
  expense({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _expenseState createState() => _expenseState();
}

class _expenseState extends State<expense> {
  Future<List<Transactions>>? _listFuture;
  String? reportTime = 'Daily';

  List<String>? reportTimeList = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
  DateTime? startDate;
  DateTime? endDate;

  void initState() {
    super.initState();
    // initial load
    _listFuture =
        MoneyDatabase.instance.getDailyData(this.widget.user!.id, 'Expense');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenSize.height * 0.03),
            Text(
              "View Report",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Container(
              width: screenSize.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Color(0xFFF1E6FF),
              ),
              child: ListTile(
                title: DropdownButton<String>(
                  value: reportTime,
                  iconEnabledColor: Color(0xFFF1E6FF),
                  dropdownColor: Color(0xFFF1E6FF),
                  elevation: 5,
                  style: TextStyle(color: Colors.grey[700]),
                  onChanged: (val) {
                    setState(() {
                      reportTime = val;
                    });
                  },
                  items: reportTimeList!
                      .map<DropdownMenuItem<String>>((String val) {
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
              width: screenSize.width * 0.4,
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
                    "Generate",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                onPressed: () async {},
              )),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenSize.width * 0.45,
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(26)),
                        ),
                        hintText: 'StartDate',
                        filled: true,
                        fillColor: Color(0xFFF1E6FF),
                        hintStyle: TextStyle(color: Colors.grey[700]),  
                      ),
                    ),
                  ),

                  Container(
                    width: screenSize.width * 0.45,
                  padding: EdgeInsets.all(15),
                  child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(26)),
                        ),
                        hintText: 'endDate',
                        filled: true,
                        fillColor: Color(0xFFF1E6FF),
                        hintStyle: TextStyle(color: Colors.grey[700]),  
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(height: screenSize.height * 0.03),
            Container(
              width: screenSize.width * 0.4,
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
                    "Generate",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                onPressed: () async {},
              )),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Text(
              "Reports",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
          ],
        ),
      ),
    );
  }
}





