import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_app/misc/colors.dart';
import 'package:good_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({Key? key,this.isResponsive,this.width=120}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius:BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment. center,
          children: [
            isResponsive==true?Container(
              margin: EdgeInsets.only(left: 20),
                child: AppText(size: 15,
                    text: "Book trip now",
                    color:Colors.white)):Container(),
            Image.asset("img/button-one.png"),
          ],
        ),
      ),
    );
  }
}
