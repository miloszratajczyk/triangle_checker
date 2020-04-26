import 'package:flutter/material.dart';
import 'package:triangle_checker/painters.dart';
import 'functions.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final controlerSideA = TextEditingController();
  static final controlerSideB = TextEditingController();
  static final controlerSideC = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controlerSideA.dispose();
    controlerSideB.dispose();
    controlerSideC.dispose();
    super.dispose();
  }

  var answerColor = Colors.grey[700];
  String answer =
      "Please provide sides, and press the button in order to get an answer.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Triangle Checker",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.33,
                ),
              ),
              Text(
                "Please input 3 triangle sides",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextField(
                      controller: controlerSideA,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Side A'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextField(
                      controller: controlerSideB,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Side B',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: TextField(
                      controller: controlerSideC,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Side C'),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    var sideA = double.tryParse(controlerSideA.text);
                    var sideB = double.tryParse(controlerSideB.text);
                    var sideC = double.tryParse(controlerSideC.text);
                    if (sideA + sideB > sideC &&
                        sideA + sideC > sideB &&
                        sideB + sideC > sideA) {
                      if (angleOfTriangle(sideA, sideB, sideC) == 0) {
                        answerColor = Colors.black;
                        answer = "This is a rectangular triangle";
                      } else if (angleOfTriangle(sideA, sideB, sideC) < 0) {
                        answerColor = Colors.black;
                        answer = "This is a obtuse triangle";
                      } else if (angleOfTriangle(sideA, sideB, sideC) > 0) {
                        answerColor = Colors.black;
                        answer = "This is an acute triangle";
                      }
                    } else {
                      answerColor = Colors.black;
                      answer = "A triangle with these sides doesn't exist";
                    }
                  });
                },
                child: const Text('Check the traingle',
                    style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    answer,
                    style: TextStyle(
                      color: answerColor,
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: TriangleDownPaint(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
