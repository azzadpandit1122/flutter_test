import 'package:flutter/material.dart';

class fistScreen extends StatefulWidget {
  const fistScreen({super.key});

  @override
  State<fistScreen> createState() => _fistScreen();
}

class _fistScreen extends State<fistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "fist Screen",
          // ignore: prefer_const_constructors
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Fist page",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.red,
              textColor: Colors.blueGrey,
            )
          ],
        ),
      ),
    );
  }
}
