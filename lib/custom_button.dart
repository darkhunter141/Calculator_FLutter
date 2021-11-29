import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custom_button extends StatelessWidget {
  late int color;
  late double fs ;
  late String bt;
  late String bv;
  Function callback;


  custom_button(this.color, this.fs, this.bt,this.callback);
  @override
  Widget build(BuildContext context) {

    var hei = MediaQuery.of(context).size.height;
    var wid = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Color(color),
          borderRadius: BorderRadius.circular(14)
      ),
      height: hei/9,
      width: wid/4.5,

      child: TextButton(onPressed: () => callback(bt), child: Text(bt,style:GoogleFonts.robotoMono(textStyle: TextStyle(
          fontSize: fs,fontWeight: FontWeight.bold,color: Colors.black
      )) ,)),

    );
  }
}
