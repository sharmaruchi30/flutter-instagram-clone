import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/utils/comment_tile.dart';


class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only( top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // GestureDetector(
                    //   onTap: (){
                    //     Navigator.pop(context);
                    //   },
                    //   child:Icon(CupertinoIcons.back , size: 35,)),
                        IconButton(onPressed: () => Navigator.pop(context), icon: Icon(CupertinoIcons.back , size: 35,)),
                      const Text("Comments", 
                      style: TextStyle(
                        fontFamily: 'sfpro',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      ),

                      const SizedBox(
                        height: 28,
                        width: 28,
                        child: Image(image: AssetImage("assets/icons/Direct.png")),
                      )
                  ],
                ),
              ),

              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                   const ClipOval(
                    
                    child: Image(image: AssetImage("assets/images/avatar.png" ) , height: 35,),
                  ),
                  const SizedBox(width: 5,),
                  Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(text: const TextSpan(
                        text: "username ",
                        style: TextStyle(
                          fontFamily: 'sfpro', fontWeight: FontWeight.bold , color: Colors.black , fontSize: 15) ,
                        children: [
                          TextSpan(
                            text: "caption of the post here!",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            )
                          ),
                        ]
                      )),

                      const SizedBox(height: 10,),
                      Text("#flutter #dart #provider ",
                      style: TextStyle(
                        color: Colors.blue.shade700
                      ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(
                thickness: 2,
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return const CommentTile();
                  }),
              )
            ],
          ),
        ),
      ),
    );
  }
}