import 'package:calculator_google/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main () {
  runApp(mainpage());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xFFCDE6E6)
  ));

}

class mainpage extends StatelessWidget {

  const mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: screena(),
    );
  }
}
