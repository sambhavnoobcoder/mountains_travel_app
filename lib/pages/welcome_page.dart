import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_app/cubit/app_cubits.dart';
import 'package:good_app/misc/colors.dart';
import 'package:good_app/widgets/app_large_text.dart';
import 'package:good_app/widgets/app_text.dart';
import 'package:good_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=["welcome-one.png","welcome-two.png","welcome-three.png"];
  List text=["Mountains are a great place of serenity as they offer a great deal of peace of mind to their travellers ",
              "high altitude peaks of the mountains often invite adventurous souls to scale their heights for thill and fun",
              "Rivers originating from the mountains are a great spot for fly fishing "];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(scrollDirection:Axis.vertical,itemCount:images.length,itemBuilder: (_,index){
        return Container(
          width: double.maxFinite,
          height:double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/"+images[index]),
                fit:BoxFit.cover
            ),
          ),
          child:Container(
            margin: EdgeInsets.only(top: 150,left:20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(size: 30, text: "Trips", color: Colors.black),
                    AppText(size: 30, text: "Mountains", color: Colors.black54),
                    SizedBox(height: 20,),
                    Container(
                      width: 250,
                      child:AppText(size: 16, text: text[index], color:AppColors.textColor2),
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        BlocProvider.of<AppCubits>(context).getData();
                      },
                      child: Container(
                          width: 200,
                          child: Row(children:[ ResponsiveButton(width:120,)])),
                    ),

                  ],
                ),
                Column(
                  children:List.generate(3, (indexDots)
                  {
                    return Container(
                      margin: EdgeInsets.only(bottom: 5),
                      width:8,
                      height: index==indexDots?25:8,
                      decoration: BoxDecoration(
                        color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                )
              ]
            ),
          )
        );
      }),
    );
  }
}
