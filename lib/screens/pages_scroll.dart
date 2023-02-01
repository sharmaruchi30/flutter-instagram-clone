import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/bottom_navigation.dart';
import 'package:instagram_clone/screens/camera_screen.dart';
import 'package:instagram_clone/screens/dm_screen.dart';
import 'package:instagram_clone/screens/home_screen.dart';


class PageScroll extends StatefulWidget {
  const PageScroll({super.key});

  @override
  State<PageScroll> createState() => _PageScrollState();
}

class _PageScrollState extends State<PageScroll> {
  final _controller = PageController(initialPage: 1);
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children:  [
          const CameraScreen(),
          HomeScreen(pageController: _controller,),
          Dm_Screen(controller: _controller,),
        ],
      ),
    );
  }
}