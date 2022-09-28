import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:good_app/misc/colors.dart';
import 'package:good_app/widgets/app_large_text.dart';
import 'package:good_app/widgets/app_text.dart';

import '../cubit/app_cubit_states.dart';
import '../cubit/app_cubits.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List ScrollImages = ["mountain.jpeg", "lake_view.jpeg", "meadows.jpeg"];
  List ScrollActivities = [
    "kayaking.png",
    "snorkling.png",
    "balloning.png",
    "hiking.png"
  ];
  List ScrollActivitiesText = ["kayaking", "snorkling", "balloning", "hiking"];

  @override
  Widget build(BuildContext context) {
    TabController _tabcontroller = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits,CubitStates>(
      builder:(context,state){

        if(state is LoadedState){
          var info=state.places;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //menu text area(top part)
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Container(
                      padding: EdgeInsets.only(top: 30, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.black54,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              // image: Image.asset()
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: NetworkImage('https://media-exp1.licdn.com/dms/image/C5603AQGIJiKeCXywOw/profile-displayphoto-shrink_400_400/0/1648644796694?e=1668643200&v=beta&t=WZ4oPy317rRUIaRKD4vkGhFe7ryOq21W81ZMfzupI-k',))
                            ),
                          )
                        ],
                      )),
                ),

                //part where "discover" is written
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: AppLargeText(
                        size: 40, text: "Discover", color: Colors.black)),

                //places,inspiration,emotions toggle menu, as well as scrollable images(container 2)
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 20, right: 20),
                      controller: _tabcontroller,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      // indicator: CircleTabbar(color: Colors.black, radius: 2),
                      tabs: [
                        Tab(text: "Places"),
                        Tab(text: "Inspiration"),
                        Tab(text: "Emotions"),
                      ],
                      indicator: CircleTabbar(color: AppColors.mainColor, radius: 4),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 40),
                  height: 400,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabcontroller,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+info[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Text("hlw"),
                      Text("bye"),
                    ],
                  ),
                ),

                //row where explore more and see all are written
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: AppLargeText(
                            size: 25, text: "Explore more", color: Colors.black)),
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        child: AppLargeText(
                            size: 15, text: "see all", color: AppColors.textColor1)),
                  ],
                ),

                //list view for kayaking , snorkeling ,ballooning,hiking
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 110,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // margin: EdgeInsets.only(right: 50),
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "img/" + ScrollActivities[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: AppText(
                                          size: 15,
                                          text: ScrollActivitiesText[index],
                                          color: Colors.black),
                                    ),
                                  ],
                                )),
                          ],
                        );
                      }),
                )
              ],
            ),
          );
        }
        else{
          return Container();
        }
      }
      )
    );

  }
}

class CircleTabbar extends Decoration {
  Color color;
  double radius;

  CircleTabbar({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    Offset circleOffset = Offset(configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
