import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var _screenVal = "0";
  double a = 0;
  double b = 0;
  String c;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Neilculator"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: Theme.of(context).textTheme.display1.fontSize * 3 + 100.0,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.fromLTRB(17, 0, 17, 0),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Text(
                _screenVal,
                style: TextStyle(
                    // Styling the text
                    fontSize: 50.0,
                    color: Colors.black),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("9"), // using custom widget _button
                _button("8"),
                _button("7"),
                _buttonfn("+", plus),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("6"), // using custom widget _button
                _button("5"),
                _button("4"),
                _buttonfn("-", minus),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("3"), // using custom widget _button
                _button("2"),
                _button("1"),
                _buttonfn("*", multiply),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buttonfn("C", clear), // using custom widget _button
                _button("0"),
                _buttonfn("=", equals),
                _buttonfn("/", divide),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String val) {
    // Creating a method of return type Widget with number and function f as a parameter
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[800],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
      ),
      child: MaterialButton(
        height: 90,
        minWidth: 90,
        child: Text(
          val,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            a *= 10;
            a += int.parse(val);
            _screenVal = a.toString();
          });
        },
      ),
      margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
    );
  }

  Widget _buttonfn(String val, Function() f) {
    // Creating a method of return type Widget with number and function f as a parameter
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[500],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
      ),
      child: MaterialButton(
          height: 90,
          minWidth: 90,
          child: Text(
            val,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.white),
          ),
          onPressed: f),
      margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
    );
  }

  plus() {
    c = "+";
    b = b + a;
    a = 0;
    setState(() {
      _screenVal = "+";
    });
  }

  minus() {
    c = "-";
    if(it==1)
      {
        b = a;
      a = 0;
      }
    b = b - a;
    setState(() {
      _screenVal = "-";
    });
  }

  multiply() {
    c = "*";
    b = ;
    a = 0;
    setState(() {
      _screenVal = "*";
    });
  }

  divide() {
    c = "/";
    b = a;
    a = 0;
    setState(() {
      _screenVal = "/";
    });
  }

  equals() {
    double temp;
    if (c == "+")
      temp = b + a;
    else if (c == "-")
      temp = b - a;
    else if (c == "*")
      temp = b * a;
    else if (c == "/") temp = b / a;
    setState(() {
      _screenVal = temp.toString();
      a = temp;
      b = 0;
    });
  }

  clear() {
    setState(() {
      a = 0;
      b = 0;
      _screenVal = "0";
    });
  }
}
