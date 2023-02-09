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
    'assets/profile_.jpg',
    'assets/profile2.jpg',
    'assets/profile3.jpg',
    'assets/profile4.jpg',
    'assets/profile5.jpg'
  ];
  List storyIdNames = [
    'Your Story',
    'Sample 1',
    'sample 2',
    "sample 3",
    "sample 4"
  ];
  List usernames = [
    'username1',
    '_username2_',
    '_username3',
    'username_4',
  ];

  List profiles = [
    "assets/profile2.jpg",
    "assets/profile3.jpg",
    "assets/profile4.jpg",
    "assets/profile_.jpg",
  ];
  List userpostImages = ["assets/portraits/user_post.jpg" , "assets/portraits/story1.jpeg", "assets/portraits/one.jpg" , "assets/portraits/two.jpg"];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(top: 20 , bottom: 50),
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
                    const Image(image: AssetImage('assets/icons/post.png'), height: 22,),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: (() {
                        widget.pageController.animateToPage(2, duration:const Duration(milliseconds: 200), curve: Curves.easeInOut);
                      }),
                      child: const SizedBox(
                          height: 22,
                          child:
                              Image(image: AssetImage('assets/icons/chat.png'))),
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                    return UserPost(image_path: userpostImages[index], userProfile: profiles[index], username:usernames[index],);
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
