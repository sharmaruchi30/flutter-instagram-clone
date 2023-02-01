import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/pages_scroll.dart';
import 'package:instagram_clone/screens/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [PageScroll() ,ProfileScreen() , ProfileScreen() , ProfileScreen() , ProfileScreen()];
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
                     Icon(
                      Icons.home_filled,
                      size: selectedIndex == 0? 32 :28,
                    ),
                    0),
                nav_bar_item(
                    context,
                   Icon(
                      CupertinoIcons.search,
                      size: selectedIndex == 1 ? 32 : 28,
                    ),
                    1),
                nav_bar_item(context,
                    SizedBox(
                      height: selectedIndex == 2 ? 32 :30 ,
                      width: selectedIndex ==2 ? 32 : 30,
                      child: Image(image: AssetImage(selectedIndex == 2 ?  "assets/icons/reelssel.png" :"assets/icons/reels.png" ) , color: Colors.black, )) , 2),
                nav_bar_item(context,Icon( selectedIndex == 3?  CupertinoIcons.heart_fill:CupertinoIcons.heart , size: selectedIndex == 3? 32 : 28,), 3),
                nav_bar_item(
                    context,
                    Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        CircleAvatar(
                          radius: selectedIndex == 4 ?16 : 14,
                          child: Image(image: AssetImage('assets/images/avatar.png')),
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
