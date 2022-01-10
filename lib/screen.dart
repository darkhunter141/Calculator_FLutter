import 'package:calculator_google/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'custom_button.dart';

class screena extends StatefulWidget {
  @override
  State<screena> createState() => _screenaState();
}

class _screenaState extends State<screena> {
  String history = "0";
  String result = "0";
  String expression = "";
  double historyFontSize = 38.0;
  double resultFontSize = 48.0;

  void rnf(String buttonText) {
    print(buttonText);
    setState(() {
      if (buttonText == "AC") {
        history = "0";
        result = "0";
        historyFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        historyFontSize = 48.0;
        resultFontSize = 38.0;
        history = history.substring(0, history.length - 1);
        if (history == "") {
          history = "0";
        }
      } else if (buttonText == "=") {
        expression = history;

        expression = expression.replaceAll('X', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll("%", "/100");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        historyFontSize = 48.0;
        resultFontSize = 38.0;
        if (history == "0") {
          history = buttonText;
        } else {
          history = history + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: hei / 3.4,
              width: wid,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Color(0xFFCDE6E6)),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text("$history",
                                  style: TextStyle(fontSize: 50))),
                        )),
                    SizedBox(
                      height: hei / 40,
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text("$result", style: TextStyle(fontSize: 40)))
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      custom_button(0xFFB5E7F4, 35, "AC", rnf),
                      custom_button(0xFFB5E7F4, 35, "⌫", rnf),
                      custom_button(0xFF9BF1CB, 35, "%", rnf),
                      custom_button(0xFF9BF1CB, 35, "/", rnf)
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  custom_button(0xFFDFE7EB, 35, "7", rnf),
                  custom_button(0xFFDFE7EB, 35, "8", rnf),
                  custom_button(0xFFDFE7EB, 35, "9", rnf),
                  custom_button(0xFF9BF1CB, 35, "X", rnf)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  custom_button(0xFFDFE7EB, 35, "4", rnf),
                  custom_button(0xFFDFE7EB, 35, "5", rnf),
                  custom_button(0xFFDFE7EB, 35, "7", rnf),
                  custom_button(0xFF9BF1CB, 40, "-", rnf)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  custom_button(0xFFDFE7EB, 35, "1", rnf),
                  custom_button(0xFFDFE7EB, 35, "2", rnf),
                  custom_button(0xFFDFE7EB, 35, "3", rnf),
                  custom_button(0xFF9BF1CB, 40, "+", rnf)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  custom_button(0xFFDFE7EB, 35, "00", rnf),
                  custom_button(0xFFDFE7EB, 40, "0", rnf),
                  custom_button(0xFFDFE7EB, 35, ".", rnf),
                  custom_button(0xFF9BF1CB, 40, "=", rnf)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
