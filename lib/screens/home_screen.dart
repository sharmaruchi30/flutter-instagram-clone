import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instagram_clone/screens/utils/insta_story.dart';
import 'package:instagram_clone/screens/utils/user_post.dart';

class HomeScreen extends StatefulWidget {
  PageController pageController;
  HomeScreen({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List storyisSelf = [true, false, false, false, false];
  List storyisLive = [false, true, false, false, false];
  List storyImages = [
    'assets/images/avatar.png',
    'assets/images/story/Profile 1.png',
    'assets/images/story/Profile 2.jpg',
    'assets/images/story/Profile 3.jpg',
    'assets/images/story/Profile 4.jpg'
  ];
  List storyIdNames = [
    'Your Story',
    'leevahq',
    'sample 2',
    "sample 3",
    "sample 4"
  ];

  List userpostImages = ["assets/images/user_post.jpg" , "assets/images/story/Profile 4.jpg", "assets/images/story/Profile 3.jpg" , "assets/images/story/Profile 2.jpg"];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          //appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Instagram LOGO
                const SizedBox(
                    height: 35,
                    child: Image(
                        image: AssetImage("assets/icons/Instagram Logo.png"))),

                Row(
                  children: [
                    const Image(image: AssetImage('assets/icons/new-video.png')),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: (() {
                        widget.pageController.animateToPage(2, duration:Duration(milliseconds: 200), curve: Curves.easeInOut);
                      }),
                      child: const SizedBox(
                          height: 22,
                          child:
                              Image(image: AssetImage('assets/icons/Direct.png'))),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                    width: ScreenUtil().screenWidth,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Insta_Story(
                                  isLive: storyisLive[index],
                                  img_path: storyImages[index],
                                  id_name: storyIdNames[index],
                                  isSelf: storyisSelf[index],
                                );
                              }),
                        )
                      ],
                    ),
                  ),

                  //USER POST
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                    return UserPost(image_path: userpostImages[index],);
                  }))
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
