import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Card Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ImageCard(context),
    );
  }
}

Widget ImageCard(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(15),
    child: Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(0, 40, 0, 100),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Ink.image(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1613330916855-d27dbb9f5500?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(1, 18, 0, 25),
            child: Text(
              "Can you Guess Which Avenger is in the above image?",
              style: TextStyle(fontSize: 16),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton.icon(
                onPressed: () {
                  ResultAlert(context, true);
                },
                icon: Icon(Icons.shield_rounded),
                label: Text("Captain America"),
                color: Colors.red,
                elevation: 6,
              ),
              RaisedButton.icon(
                onPressed: () {
                  ResultAlert(context, false);
                },
                icon: Icon(Icons.speed),
                label: Text("QuickSliver"),
                color: Colors.red,
                elevation: 6,
              )
            ],
          )
        ],
      ),
    ),
  );
}

void ResultAlert(BuildContext context, bool cond) {
  var alertDialog = AlertDialog(
    content: cond ? Image.network("https://media4.giphy.com/media/26tknCqiJrBQG6bxC/200.webp?cid=ecf05e470wdu1c2gqfibbv19v2qk6cfb3abrjajjysb6u69m&rid=200.webp&ct=g", fit: BoxFit.cover) : Image.network("https://media2.giphy.com/media/hPPx8yk3Bmqys/200.webp?cid=ecf05e475zekyn0y73oj4f39u50jbj36xa8d6lk1dd4a8a7d&rid=200.webp&ct=g", fit: BoxFit.cover),
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(23)
      ),
    );

  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}
