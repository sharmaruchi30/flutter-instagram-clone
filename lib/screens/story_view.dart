import 'dart:async';

import 'package:flutter/material.dart';

class StoryView extends StatefulWidget {
  String imgPath;
  StoryView({
    Key? key,
    required this.imgPath,
  }) : super(key: key);

  @override
  State<StoryView> createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  double _value = 0;
  late Timer _timer;

  void StartTimer (){
    _timer = Timer.periodic(Duration(microseconds: 1000), (timer) {
      setState(() {
        _value += 0.001;
        if(_value>1){
          _timer.cancel();
          Navigator.pop(context);
        }
      });
     });
  }
  @override
  void initState() {
    // TODO: implement initState
    StartTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image(image: AssetImage(widget.imgPath) , fit: BoxFit.fill,),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric( ),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: _value,
                    
                  ),
                  const SizedBox(height: 5,),

                  Row(
                    children: const [
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundImage:   AssetImage('assets/profile_.jpg'),
                      ),
                      SizedBox(width: 10,),
                      Text('_r_sharma' , 
                      style: TextStyle(
                        fontFamily: 'sfpro',
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}