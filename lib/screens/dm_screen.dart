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
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  widget.controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                )),
            title: Row(
              children: [
                const Text(
                  "syntax_error",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  CupertinoIcons.chevron_down,
                  color: Colors.black,
                  size: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                )
              ],
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  CupertinoIcons.camera,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  CupertinoIcons.add,
                  color: Colors.black,
                  size: 32,
                ),
              )
            ]),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 56),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: TextField(
                  cursorColor: Colors.grey.shade700,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.grey.shade300),
                  style: const TextStyle(height: 1.5, fontSize: 17),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //NOTE Feature
              Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade400,
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        left: 50,
                        bottom: 50,
                        child: Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(50),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              CupertinoIcons.add,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Leave a note",
                    style: TextStyle(color: Colors.grey.shade500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Requests",
                    style: TextStyle(color: Colors.blue, fontSize: 17),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MessageTile(
                img: "assets/profile_.jpg",
                userid: "_user_id_1",
              ),
              MessageTile(
                img: "assets/profile_.jpg",
                userid: "_user_id_2",
              )
            ],
          ),
        ));
  }
}

class MessageTile extends StatelessWidget {
  String img;
  String userid;
  MessageTile({
    Key? key,
    required this.img,
    required this.userid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:  AssetImage(img),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userid,
                      style:const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Seen 20m ago",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                  ],
                )
              ],
            ),
            Icon(
              CupertinoIcons.camera,
              color: Colors.grey.shade500,
              size: 26,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
