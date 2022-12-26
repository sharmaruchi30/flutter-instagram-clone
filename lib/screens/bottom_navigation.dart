import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/profile_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProfileScreen(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children:[
                nav_bar_item(
                    context,
                   const  Icon(
                      Icons.home_filled,
                      size: 28,
                    ),
                    0),
                nav_bar_item(
                    context,
                   const  Icon(
                      CupertinoIcons.search,
                      size: 28,
                    ),
                    1),
                nav_bar_item(context,
                   const  Image(image: AssetImage("assets/icons/Reelbl.png")), 2),
                nav_bar_item(context,const  Icon(CupertinoIcons.heart , size: 28,), 3),
                nav_bar_item(
                    context,
                    Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const CircleAvatar(
                          radius: 14,
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
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width / 5,
      color: Colors.white,
      child: Center(
        child: icon,
      ),
    );
  }
}
