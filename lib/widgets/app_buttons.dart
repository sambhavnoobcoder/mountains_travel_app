import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_app/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {

  Color color;
  Color backgroundColor;
  double size;
  Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButtons({Key? key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.text,
    this.icon,
    this.isIcon=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color:borderColor,
          width: 1.0,
        ),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
      ),
      child: isIcon==false?Center(child: AppText(size: 20, text: text!, color:color)):Center(child: Icon(icon,color: color,)),
    );
  }
}
