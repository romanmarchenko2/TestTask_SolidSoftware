import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MainScreen()),
  );
}

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => new MainScreenState();
}

class SecondScreen extends StatelessWidget {
  final String infoText =
      "You can see the test task from Solid Software. You, as a user, can click anywhere on the screen and the background will be changed to a random color. Good luck:)";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Info')),
        body: Center(
            child: Container(
          padding: const EdgeInsets.all(32.0),
          child: Stack(
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.insert_emoticon,
                  color: Colors.blue,
                  size: 60,
                ),
              ),
              Text(infoText,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.black87, fontSize: 30),
                  maxLines: 7),
            ],
          ),
        )));
  }
}

class MainScreenState extends State<MainScreen> {
  final Random randomColor = Random();

  Color bgColor = Color(256);
  double opasity = 0.5;

  void changeColor() {
    setState(() {
      bgColor = Color.fromRGBO(randomColor.nextInt(256),
          randomColor.nextInt(256), randomColor.nextInt(256), opasity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Test Task"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
              child: InkWell(
                  onTap: changeColor,
                  child: Container(
                    color: bgColor,
                  ))),
          Center(
            child: Text('Hey there',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}
