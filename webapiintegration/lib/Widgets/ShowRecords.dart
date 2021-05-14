import 'package:flutter/material.dart';
import 'drawer.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ShowRecords extends StatefulWidget {
  ShowRecords({Key? key}) : super(key: key);

  @override
  _ShowRecordsState createState() => _ShowRecordsState();
}

class _ShowRecordsState extends State<ShowRecords> {
  late Future<List<Consumer>> consumersList;

  @override
  void initState() {
    super.initState();
    consumersList = fetchConsumersList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Consumer Records"),
        ),
        drawer: Sidebar(),
        body: Container(
            padding: EdgeInsets.all(16),
            child: FutureBuilder<List<Consumer>>(
                future: consumersList,
                builder: (context, consumer) {
                  if (consumer.hasData) {
                     return DataTable(
                      columns: [
                        DataColumn(label: Text("First Name", style: TextStyle(fontWeight: FontWeight.bold),)), //First Name
                        DataColumn(label: Text("Last Name", style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text("Gender", style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text("Email", style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataColumn(label: Text("Phone", style: TextStyle(fontWeight: FontWeight.bold),)),
                      ],
                      rows: [
                          ...consumer.data!.map((var cons) => 
                          DataRow(
                           cells: [
                            DataCell(Text('${cons.firstName}')),
                            DataCell(Text('${cons.lastName}')),
                            DataCell(Text('${cons.gender}')),
                            DataCell(Text('${cons.email}')),
                            DataCell(Text('${cons.phone}')),
                          ])
                          )
                      ],
                    );
                  } else if (consumer.hasError) {
                    return Text("Error: ${consumer.error}");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })));
  }
}


Future<List<Consumer>> fetchConsumersList() async {
  final response = await http.get(Uri.parse('https://pcc.edu.pk/ws/list/rs_consumers.php'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Consumer>((json) => Consumer.fromJson(json)).toList();
    
  } else {
    throw Exception("Unable to show the data");
  }
}

class Consumer {
  final String firstName;
  final String lastName;
  final String gender;
  final String email;
  final String phone;

  Consumer(
      {required this.firstName,
      required this.lastName,
      required this.gender,
      required this.email,
      required this.phone});

  factory Consumer.fromJson(Map<String, dynamic> json) {
    return Consumer(
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        email: json['email'],
        phone: json['phone']);
  }
}
