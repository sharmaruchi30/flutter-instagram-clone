import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  PageController _controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        ReelVideoScreen(),
        ReelVideoScreen(),
        ReelVideoScreen()
      ],
    );
  }
}


class ReelVideoScreen extends StatelessWidget {
  const ReelVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Container(
          color: Colors.black45,
        ),

        Padding(
          padding: const EdgeInsets.only(top: 50, left: 16 ,right: 16 , bottom: 70 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const [
                  Text("Reels", 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                  ),
                  ),

                  Icon(CupertinoIcons.camera , color: Colors.white, size: 28,)
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                         const  CircleAvatar(
                            backgroundColor: Colors.black,

                          ),
                          const SizedBox(width: 10,),
                          const Text("UserName" , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold ),),
                          const SizedBox(width: 10,),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 13
                            , vertical: 8),

                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: const Text("Follow", style: TextStyle(
                              color: Colors.white,
                              fontSize: 15
                            ),),
                          )
                        ],
                      ),
                      const SizedBox(height: 8,),
                      const Text("sloan.bird - Original audio" , style: TextStyle(
                        color: Colors.white
                      ),)
                    ],
                  ),

                  Column(
                    children: [
                      const Icon(CupertinoIcons.heart , size: 30, color: Colors.white,),
                      const SizedBox(height: 5,),
                      const Text("80.1k" , style: TextStyle(color: Colors.white),),
                      const SizedBox(height: 10,),
                      const Icon(Icons.message, size: 30, color: Colors.white,),
                      const SizedBox(height: 5,),
                      const Text("80.1k" , style: TextStyle(color: Colors.white),),
                      const SizedBox(height: 10,),
                      const Icon(Icons.send , size: 30, color: Colors.white,),
                      const SizedBox(height: 15,),

                      const Icon(Icons.more_vert, color: Colors.white , size: 30,),
                      const SizedBox(height: 15,),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white , width: 2)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(image: AssetImage("assets/profile2.jpg") , fit: BoxFit.cover,)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}