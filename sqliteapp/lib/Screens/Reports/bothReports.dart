import 'package:flutter/material.dart';
import 'package:sqliteapp/database/money_database.dart';
import '../../components/drawerS.dart';
import '../../models/user.dart';
import '../../models/transaction.dart';


class bothReports extends StatefulWidget {
  bothReports({Key? key, this.user}) : super(key: key);
  final User? user;

  @override
  _bothReportsState createState() => _bothReportsState();
}

class _bothReportsState extends State<bothReports> {
  Future<List<Transactions>>? _listFutureExpense;
  Future<List<Transactions>>? _listFutureRevenue;
  String? reportTime = 'Daily';

  List<String>? reportTimeList = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  void initState() {
    super.initState();
    // initial load
    _listFutureExpense =
        MoneyDatabase.instance.getDailyData(this.widget.user!.id, 'Expense');
    _listFutureRevenue =
        MoneyDatabase.instance.getDailyData(this.widget.user!.id, 'Revenue');
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
                    "Please select time",
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
                      _listFutureRevenue = MoneyDatabase.instance
                          .getDailyData(this.widget.user!.id, 'Revenue');
                      _listFutureExpense = MoneyDatabase.instance
                          .getDailyData(this.widget.user!.id, 'Expense');
                    });
                  } else if (reportTime == 'Weekly') {
                    setState(() {
                      _listFutureRevenue = MoneyDatabase.instance
                          .getWeeklyData(this.widget.user!.id, 'Revenue');
                      _listFutureExpense = MoneyDatabase.instance
                          .getWeeklyData(this.widget.user!.id, 'Expense');
                    });
                  } else if (reportTime == 'Monthly') {
                    setState(() {
                      _listFutureRevenue = MoneyDatabase.instance
                          .getMonthlyData(this.widget.user!.id, 'Revenue');
                      _listFutureExpense = MoneyDatabase.instance
                          .getMonthlyData(this.widget.user!.id, 'Expense');
                    });
                  } else {
                    setState(() {
                      _listFutureRevenue = MoneyDatabase.instance
                          .getYearlyData(this.widget.user!.id, 'Revenue');
                      _listFutureExpense = MoneyDatabase.instance
                          .getYearlyData(this.widget.user!.id, 'Expense');
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
                    _listFutureExpense =  MoneyDatabase.instance.getperodicallyData(this.widget.user!.id,startDate, endDate, 'Expense');
                    _listFutureRevenue = MoneyDatabase.instance.getperodicallyData(this.widget.user!.id,startDate, endDate, 'Revenue');

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
            ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  FutureBuilder(
                    future: _listFutureExpense,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Transactions>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              width: screenSize.width * 95,
                              child: Text(
                                "On '${(DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].transactionDate)).toString().substring(0, 10)}' amount of RS'${snapshot.data![index].drAmount}'/- was transferred to account '${snapshot.data![index].accountId}' which was '${snapshot.data![index].description}'",
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
            ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  FutureBuilder(
                    future: _listFutureRevenue,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Transactions>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              width: screenSize.width * 95,
                              child: Text(
                                "On '${(DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].transactionDate)).toString().substring(0, 10)}' amount of RS'${snapshot.data![index].drAmount}'/- was recieved from account '${snapshot.data![index].accountId}' which was '${snapshot.data![index].description}'",
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
