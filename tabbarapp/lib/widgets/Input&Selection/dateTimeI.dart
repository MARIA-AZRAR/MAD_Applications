import 'package:flutter/material.dart';

class dateTimeI extends StatefulWidget {
  dateTimeI({Key? key}) : super(key: key);

  @override
  _dateTimeIState createState() => _dateTimeIState();
}

class _dateTimeIState extends State<dateTimeI> {
  DateTime currentDate = DateTime.now();
  bool flagD = true;
  bool flagT = true;
  String startValueD = "Select Date"; 
   String startValueT = "Select Time";

  TimeOfDay currentTime = TimeOfDay(hour: 00, minute: 00);


  //Date Picker Created
  Future<Null> _dateSelector(BuildContext context) async {
    final DateTime? dateSelected = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2111));
    if (dateSelected != null)
      setState(() {
        currentDate = dateSelected;
        flagD = false;
      });
  }

  //Time Picker
  Future<Null> _selectTime(BuildContext context) async {
  final TimeOfDay? pickedDate = await showTimePicker(
    context: context,
    initialTime: currentTime,
  );
  if (pickedDate != null)
    setState(() {
      currentTime = pickedDate;
      flagT = false;
    });
    
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(25,35,25,25),
        child: Column(
          children: [
            Text(
              "Date Picker",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: TextButton(
                onPressed: () => _dateSelector(context),
                child: Text(
                  flagD
                      ? startValueD
                      : "${currentDate.day} - ${currentDate.month} - ${currentDate.year}",
                  style: TextStyle(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -10))
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.lightGreen,
                    decorationThickness: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),

              Text(
              "Time Picker",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[300],
              child: TextButton(
                onPressed: () => _selectTime(context),
                child: Text(
                  flagT
                      ? startValueT
                      : "${currentTime.hour} : ${currentTime.minute}",
                  style: TextStyle(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, -10))
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.lightGreen,
                    decorationThickness: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
