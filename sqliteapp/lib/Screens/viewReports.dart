import 'package:flutter/material.dart';
import 'package:sqliteapp/database/money_database.dart';
import '../components/drawerS.dart';
import '../models/user.dart';
import '../models/transaction.dart';
import 'Reports/bothReports.dart';

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
            report(
              user: this.widget.user,
              type: 'Expense',
              keyword: 'transferred to',
            ),
            report(
              user: this.widget.user,
              type: 'Revenue',
              keyword: 'Paid to',
            ),
            bothReports(user: this.widget.user),
          ],
        ),
      ),
    );
  }
}

class report extends StatefulWidget {
  report({Key? key, this.user, this.type, this.keyword}) : super(key: key);
  final User? user;
  final String? type;
  final String? keyword;

  @override
  _reportState createState() => _reportState();
}

class _reportState extends State<report> {
  Future<List<Transactions>>? _listFuture;
  String? reportTime = 'Daily';

  List<String>? reportTimeList = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  void initState() {
    super.initState();
    // initial load
    _listFuture = MoneyDatabase.instance
        .getDailyData(this.widget.user!.id, this.widget.type!);
  }

  DateTime currentDate = DateTime.now();
  bool flagD = true;
  String startValueD = "Start Date";
  String endValueD = "End Date";

  //Date Picker Created
  Future<Null> _startDateSelector(BuildContext context) async {
    final DateTime? dateSelected = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2111));
    if (dateSelected != null)
      setState(() {
        currentDate = dateSelected;
        startDate = dateSelected;
        flagD = false;
      });
  }

  //Date Picker Created
  Future<Null> _endDateSelector(BuildContext context) async {
    final DateTime? dateSelected = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2111));
    if (dateSelected != null)
      setState(() {
        currentDate = dateSelected;
        endDate = dateSelected;
        flagD = false;
      });
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
                onPressed: () async {
                  if (reportTime == 'Daily') {
                    setState(() {
                      _listFuture = MoneyDatabase.instance.getDailyData(
                          this.widget.user!.id, this.widget.type!);
                    });
                  } else if (reportTime == 'Weekly') {
                    setState(() {
                      _listFuture = MoneyDatabase.instance.getWeeklyData(
                          this.widget.user!.id, this.widget.type!);
                    });
                  } else if (reportTime == 'Monthly') {
                    setState(() {
                      _listFuture = MoneyDatabase.instance.getMonthlyData(
                          this.widget.user!.id, this.widget.type!);
                    });
                  } else {
                    setState(() {
                      _listFuture = MoneyDatabase.instance.getYearlyData(
                          this.widget.user!.id, this.widget.type!);
                    });
                  }
                },
              )),
            ),
            SizedBox(height: screenSize.height * 0.001),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenSize.width * 0.45,
                  padding: EdgeInsets.all(15),
                  child: TextButton(
                    onPressed: () => _startDateSelector(context),
                    child: Text(
                      flagD
                          ? startValueD
                          : "${startDate.day} - ${startDate.month} - ${startDate.year}",
                      style: TextStyle(
                        shadows: [
                          Shadow(color: Colors.black, offset: Offset(0, -10))
                        ],
                        color: Colors.transparent,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFF1E6FF),
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width * 0.45,
                  padding: EdgeInsets.all(15),
                  child: TextButton(
                    onPressed: () => _endDateSelector(context),
                    child: Text(
                      flagD
                          ? endValueD
                          : "${endDate.day} - ${endDate.month} - ${endDate.year}",
                      style: TextStyle(
                        shadows: [
                          Shadow(color: Colors.black, offset: Offset(0, -10))
                        ],
                        color: Colors.transparent,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFF1E6FF),
                        decorationThickness: 1,
                      ),
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
                onPressed: () async {
                  setState(() {
                    _listFuture=  MoneyDatabase.instance.getperodicallyData(this.widget.user!.id,startDate, endDate, this.widget.type!);                    
                  });

                },
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
            ListView(shrinkWrap: true, children: [
              FutureBuilder(
                future: _listFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Transactions>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(16),
                          width: screenSize.width * 95,
                          child: Text(
                            "On '${(DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].transactionDate)).toString().substring(0, 10)}' amount of RS'${snapshot.data![index].drAmount}'/- was '${this.widget.keyword!}' account '${snapshot.data![index].accountId}' which was '${snapshot.data![index].description}'",
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
            SizedBox(height: screenSize.height * 0.03),
          ],
        ),
      ),
    );
  }
}
