import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/likes_bottomnav.dart';
import 'package:instagram_clone/screens/pages_scroll.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/reels_page.dart';
import 'package:instagram_clone/screens/search_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  List<String> user_post_images = [
    'assets/portraits/storymy3.jpg',
    'assets/portraits/storymy1.jpg',
    'assets/landscapes/retrocamera.jpg',
    'assets/landscapes/laptop.jpg',
    'assets/landscapes/hpexpress.jpg',
    'assets/landscapes/retrocamera2.jpg',
    'assets/landscapes/train.jpg',
    
    // 'assets/portraits/hpplatform.jpg',
    // 'assets/portraits/hpout.jpg',
  ];

  
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [PageScroll() ,SearchPage() , ReelsPage() , LikesBottomNav() , ProfileScreen(selfProfile: true,bio: "Flutter Developer",user_post_images: user_post_images, user_profile: 'assets/profile_.jpg', username: '_r_sharma', display_name: 'R. S.',)];
    return Scaffold(
      body: Stack(
        children: [
          screens[selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children:[
                nav_bar_item(
                    context,
                     const Icon(
                      Icons.home_filled,
                      size: 32,
                    ),
                    0),
                nav_bar_item(
                    context,
                   const Icon(
                      CupertinoIcons.search,
                      size: 32,
                    ),
                    1),
                nav_bar_item(context,
                    SizedBox(
                      height: 32 ,
                      width: 32,
                      child: Image(image: AssetImage(selectedIndex == 2 ?  "assets/icons/reelssel.png" :"assets/icons/reels.png" ) , color: Colors.black, )) , 2),
                nav_bar_item(context,Icon( selectedIndex == 3?  CupertinoIcons.heart_fill:CupertinoIcons.heart , size:32), 3),
                nav_bar_item(
                    context,
                    Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const CircleAvatar(
                          radius: 16,
                          backgroundImage:  AssetImage('assets/profile_.jpg'),
                        ),
                        const SizedBox(height: 5,),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red
                          ),
                        )
                      ],
                    ),
                    4)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget nav_bar_item(BuildContext context, Widget icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        color: Colors.white,
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
