import 'package:flutter/material.dart';

class radioI extends StatefulWidget {
  radioI({Key? key}) : super(key: key);

  @override
  _radioIState createState() => _radioIState();
}

enum FavouriteMovie { longestRide, meBeforeYou, aWalkToRemember }

class _radioIState extends State<radioI> {
  FavouriteMovie _movie = FavouriteMovie.longestRide;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              "Radio Button",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "What is Your Favourite Dramatic Movie?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text('The Longest Ride'),
                    leading: Radio(
                      value: FavouriteMovie.longestRide,
                      groupValue: _movie,
                      onChanged: (FavouriteMovie? value) {
                        setState(() {
                          _movie = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Me Before You'),
                    leading: Radio(
                      value: FavouriteMovie.meBeforeYou,
                      groupValue: _movie,
                      onChanged: (FavouriteMovie? value) {
                        setState(() {
                          _movie = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('A Walk To Remember'),
                    leading: Radio(
                      value: FavouriteMovie.aWalkToRemember,
                      groupValue: _movie,
                      onChanged: (FavouriteMovie? value) {
                        setState(() {
                          _movie = value!;
                        });
                      },
                    ),
                  ),                                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
