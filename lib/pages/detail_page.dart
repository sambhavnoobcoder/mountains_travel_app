import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_app/cubit/app_cubit_states.dart';
import 'package:good_app/cubit/app_cubits.dart';
import 'package:good_app/misc/colors.dart';
import 'package:good_app/widgets/app_buttons.dart';
import 'package:good_app/widgets/app_large_text.dart';
import 'package:good_app/widgets/app_text.dart';
import 'package:good_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int StarsRecieved=4;
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
      return BlocBuilder<AppCubits,CubitStates>(builder: (context,state){
        DetailState detail=state as DetailState;

        return Scaffold(
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                //for background image
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width:double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
                          fit: BoxFit.cover,
                        )
                        ,
                      ),


                    )),

                //for top menus
                Positioned(

                    left: 20,
                    top: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){
                          BlocProvider.of<AppCubits>(context).goHome();
                        }, icon: Icon(Icons.menu,color: Colors.white,)),
                        SizedBox(width: 250,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.more_vert,color: Colors.white,)),
                      ],
                    )),

                //for bottom container
                Positioned(
                    top: 320,
                    child: Container(
                      padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name of place amd price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(size: 25, text: detail.place.name, color: Colors.black.withOpacity(0.8)),
                              AppLargeText(size: 25, text: "\$"+detail.place.price.toString(), color: AppColors.mainColor),
                            ],
                          ),

                          //location
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.location_on,color: AppColors.mainColor,),
                              SizedBox(width: 5,),
                              AppText(size: 15, text: detail.place.location, color:AppColors.textColor1),
                            ],
                          ),

                          //stars
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              //stars
                              Wrap(
                                children:
                                List.generate(5, (index) {
                                  return Icon(Icons.star,color: index<detail.place.stars?AppColors.starColor:AppColors.textColor2,);
                                })
                                ,
                              ),

                              SizedBox(width: 10,),

                              AppText(size: 18, text: "(5.0)", color: AppColors.textColor2),

                            ],
                          ),

                          //text people
                          SizedBox(height: 25,),
                          AppLargeText(size: 20, text: "People", color: Colors.black.withOpacity(0.8)),

                          //asks for the number of people
                          SizedBox(height: 5,),
                          AppText(size: 15, text: "Number of people in your group", color:AppColors.mainTextColor),

                          //make buttons
                          SizedBox(height: 10,),
                          Wrap(
                            children:
                            List.generate(5, (index) {
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    selectedIndex=index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: AppButtons(color: selectedIndex==index?Colors.white:Colors.black,
                                    backgroundColor: selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                    size: 50,
                                    borderColor:selectedIndex==index?Colors.black:AppColors.buttonBackground,
                                    text: (index+1).toString(),),
                                ),
                              );
                            })
                            ,
                          ),

                          //write description
                          SizedBox(height: 20,),
                          AppLargeText(size: 20, text: "Description", color: Colors.black.withOpacity(0.8)),

                          //write description content
                          SizedBox(height: 10,),
                          AppText(size: 15, text: detail.place.description, color: AppColors.mainTextColor),

                          //for bottom two buttons
                          SizedBox(height: 10,),
                          Container(
                            child: Row(
                              children: [
                                AppButtons(color: AppColors.textColor2, backgroundColor: Colors.white, size: 60, borderColor: AppColors.textColor2,isIcon: true,icon: Icons.favorite_border,),
                                SizedBox(width: 40,),
                                ResponsiveButton(
                                  isResponsive: true,
                                  // width: 60,
                                ),
                              ],

                            ),)


                        ],
                      ),
                    )),

                // for bottom two buttons
                // Positioned(
                //     child: Row(
                //       children: [
                //         AppButtons(color: AppColors.textColor2, backgroundColor: Colors.white, size: 60, borderColor: AppColors.textColor2,isIcon: true,icon: Icons.favorite_border,),
                //       ],
                //
                //     ),)


              ],
            ),
          ),

        );

      });
        }
}
