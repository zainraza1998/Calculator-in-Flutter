import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var result = "";
  Widget btn(var showbtn) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + showbtn;
          });
        },
        child: Text(showbtn));
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = new Parser();
    Expression ex = p.parse(result);
    ContextModel cm = new ContextModel();
    double eval = ex.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("4"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("5"),
              btn("6"),
              btn("7"),
              btn("8"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("9"),
              btn("0"),
              btn("+"),
              btn("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("*"),
              btn("/"),
              ElevatedButton(onPressed: clearr, child: Text("Clear")),
              ElevatedButton(onPressed: output, child: Text("=")),
            ],
          ),
        ],
      ),
    );
  }
}
