import 'package:flutter/material.dart';

class SecoundScreen extends StatefulWidget {
  const SecoundScreen({super.key});

  @override
  State<SecoundScreen> createState() => _SecoundScreen();
}

class _SecoundScreen extends State<SecoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "Seound screet",
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
              "Secound Screen",
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
