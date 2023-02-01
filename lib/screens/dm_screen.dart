import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dm_Screen extends StatefulWidget {
  PageController controller;
  Dm_Screen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<Dm_Screen> createState() => _Dm_ScreenState();
}

class _Dm_ScreenState extends State<Dm_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed: (){
        widget.controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }, icon: const Icon(CupertinoIcons.back))]),
      body: const Center(
        child: Text("Messages Screen"),
      ),
    );
  }
}