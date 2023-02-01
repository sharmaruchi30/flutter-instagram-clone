import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatefulWidget {
  const CommentTile({super.key});

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          //image
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ClipOval(
                child: Image(
                  image: AssetImage('assets/images/story/Profile 4.jpg'),
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
              ),
              const SizedBox(width: 5,),
               Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                //Username
                text: const TextSpan(
                    text: "enzetto ",
                    style: TextStyle(
                        fontFamily: 'sfpro',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    //Comment
                    children: [
                      TextSpan(
                          text: "nice one",
                          style: TextStyle(fontWeight: FontWeight.normal))
                    ]),
              ),

              //time
              Row(
                children: const [
                  Text(
                    "15m",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 13),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Reply",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
            ],
          ),

          const Icon(
            CupertinoIcons.heart,
            size: 15,
          )
        ],
      ),
    );
  }
}
