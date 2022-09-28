import 'package:flutter/material.dart';



//todo

//simple profile page with image on the top , name and a bio of an adventurer across the lands





void main() => runApp(MaterialApp(
      home: MyPage(),
    ));

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image.network(
                //   // <-- SEE HERE
                //   'https://media-exp1.licdn.com/dms/image/C5603AQGIJiKeCXywOw/profile-displayphoto-shrink_400_400/0/1648644796694?e=1668643200&v=beta&t=WZ4oPy317rRUIaRKD4vkGhFe7ryOq21W81ZMfzupI-k',
                // ),
                // Text("hue hue hue"),
                Center(
                  // child: Center(
                  //   child: Image.network(
                  //       " https://media.gettyimages.com/photos/actor-chris-evans-arrives-for-the-91st-annual-academy-awards-at-the-picture-id1127197892?s=612x612"),
                  // ),
                  // child: Text(
                  //   "hue hue hue",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     color: Colors.amberAccent[200],
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 28.0,
                  //     letterSpacing: 2.0,
                  //   ),
                  // ),
                  child: CircleAvatar(
                    radius: 120.0,
                    backgroundImage: NetworkImage(
                      // "https://thumbs.dreamstime.com/b/portrait-young-handsome-man-white-shirt-outdoor-portrait-young-handsome-man-white-shirt-outdoor-nice-appearance-131934608.jpg"),
                      'https://media-exp1.licdn.com/dms/image/C5603AQGIJiKeCXywOw/profile-displayphoto-shrink_400_400/0/1648644796694?e=1668643200&v=beta&t=WZ4oPy317rRUIaRKD4vkGhFe7ryOq21W81ZMfzupI-k',
                    ),
                  ),
                ),

                // Divider(
                //   color: Colors.amber,
                //   height: 60,
                // ),
                SizedBox(height: 40),

                // children: const <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'NAME:',
                    //   style: TextStyle(
                    //     color: Colors.grey,
                    //     letterSpacing: 2.0,
                    //     // fontSize:20,
                    //   ),
                    // ),
                    Text(
                      'Sambhav Dixit',
                      style: TextStyle(
                        color: Colors.black,
                        // letterSpacing: 1.0,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
                // ],



                SizedBox(height: 30,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                    "Bio",
                      style: TextStyle(
                        color: Colors.grey,
                        // letterSpacing: 1.0,
                        fontSize: 25,
                      ),
                  )
                ]),

                SizedBox(height: 30,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
children:[


                          // width: double.maxFinite,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.green),
                          // ),
                          Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black,style: BorderStyle.solid,width: 2),
                              color: Colors.grey[100],
                            ),

                            child: Center(
                              child: Text(
                                "I am an avid traveller and and adventurer qwhi likes to vist new places for seeking thrill and adventure.",
                                softWrap:false,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(
                                  color: Colors.black54,
                                  // letterSpacing: 1.0,
                                  fontSize: 20,

                                ),
                              ),
                            ),
                          )
                          ),

                    ]
                    )
              ],
            )

            // ],
            ));
  }
}
