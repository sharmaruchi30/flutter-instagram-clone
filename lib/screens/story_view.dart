import 'dart:async';

import 'package:flutter/material.dart';


class StoryView extends StatefulWidget {
  const StoryView({super.key});

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
              child: Container(
                
                child: Text("STORY VIEW PAGE"),
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
                        child:  Image(image: AssetImage('assets/images/avatar.png')),
                      ),
                      SizedBox(width: 10,),
                      Text('Piero Borgo' , 
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