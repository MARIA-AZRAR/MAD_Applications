import 'package:flutter/material.dart';
import 'package:sqliteapp/components/drawerS.dart';
import '../models/user.dart';
import '../models/transaction.dart';

class viewTransactions extends StatefulWidget {
  viewTransactions({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  _viewTransactionsState createState() => _viewTransactionsState();
}

class _viewTransactionsState extends State<viewTransactions> {
  final formKey = GlobalKey<FormState>(); //as we'll make our code a form

  int? _id;
  TextEditingController _description = TextEditingController();
  TextEditingController _amount = TextEditingController();
  DateTime? date;
  int? convertedDate;

  Future<List<Transactions>>? _listFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(this.widget.user),
      backgroundColor: Colors.white,
      body: Text("transaction"),

    );
  }
}