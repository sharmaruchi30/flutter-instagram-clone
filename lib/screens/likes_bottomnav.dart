import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/utils/user_post.dart';

class LikesBottomNav extends StatelessWidget {
  const LikesBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(
                    fontFamily: "sfpro",
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Follow Requests
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    child: Row(
                      children: [
                        Stack(
                          children: const [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                            ),
                            Positioned(
                              left: 30,
                              top: 2,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.red,
                                child: Text(
                                  "42",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Follow Requests",
                              style: TextStyle(
                                fontFamily: 'sfpro',
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "Approve or ignore requests",
                              style: TextStyle(
                                  fontFamily: 'sfpro',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const Text(
                  "Today",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                LikedStoryTile(
                  img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy3.jpg",
                ),
                const SizedBox(
                  height: 20,
                ),

                MentionedCommentTile(
                    img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy1.jpg",
                    comment: "Comment Content"),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  "This Week",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                LikedStoryTile(
                 img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy2.jpg",
                ),
                const SizedBox(
                  height: 20,
                ),

                MentionedCommentTile(
                    img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy4.jpg",
                  comment: "comment "),

                const SizedBox(
                  height: 20,
                ),

                const Text(
                  "This Month",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                LikedStoryTile(
                  img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy5.jpg",
                ),
                const SizedBox(
                  height: 20,
                ),

                MentionedCommentTile(
                    img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy5.jpg",
                    comment: "Comment Content here"),
                const SizedBox(
                  height: 20,
                ),

                const Text(
                  "Earlier",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                LikedStoryTile(
                  img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy6.jpg",
                ),
                const SizedBox(
                  height: 20,
                ),

                MentionedCommentTile(
                    img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy7.jpg",
                    comment: "Comment Content here"),
                const SizedBox(
                  height: 20,
                ),
                LikedStoryTile(
                  img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy7.jpg",
                ),
                const SizedBox(
                  height: 20,
                ),

                MentionedCommentTile(
                    img: "assets/profile_.jpg",
                  idname: "_r_sharma",
                  postimgpath: "assets/portraits/storymy7.jpg",
                    comment: "Comment Content here"),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LikedStoryTile extends StatelessWidget {
  String img;
  String idname;
  String postimgpath;
  LikedStoryTile(
      {super.key,
      required this.img,
      required this.idname,
      required this.postimgpath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage:  AssetImage(img),
              ),
              const SizedBox(
                width: 10,
              ),
              Text.rich(TextSpan(
                  text: idname,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                  children: [
                    const TextSpan(
                        text: " liked your story. ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: " 2h",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade500)),
                  ]))
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Scaffold(
                            body: Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: Column(
                                children: [
                                  SafeArea(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (() => Navigator.pop(context)),
                                            child: const Icon(
                                              Icons.keyboard_backspace_outlined,
                                              size: 30,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Explore",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  UserPost(image_path: postimgpath, userProfile: "assets/profile_.jpg", username: "_r_sharma",),
                                ],
                              ),
                            ),
                          ))));
            },
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image(
                image: AssetImage(postimgpath),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MentionedCommentTile extends StatelessWidget {
  String img;
  String idname;
  String postimgpath;
  String comment;
  MentionedCommentTile(
      {super.key,
      required this.img,
      required this.idname,
      required this.postimgpath,
      required this.comment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(img),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: Text.rich(TextSpan(
                    text: idname,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                    children: [
                      const TextSpan(
                          text: " mentioned you in a comment: ",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal)),
                      const TextSpan(
                          text: "your ID ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.blue,
                          )),
                      TextSpan(
                        text: comment,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                          text: ". 1w",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade500,
                          )),
                    ])),
              )
            ],
          ),
          GestureDetector(
            onTap: (() => Navigator.push(context, MaterialPageRoute(
                      builder: ((context) => Scaffold(
                            body: Padding(
                              padding: const EdgeInsets.only(bottom: 40.0),
                              child: Column(
                                children: [
                                  SafeArea(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: (() => Navigator.pop(context)),
                                            child: const Icon(
                                              Icons.keyboard_backspace_outlined,
                                              size: 30,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text(
                                            "Explore",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  UserPost(image_path: postimgpath, userProfile: "assets/profile_.jpg", username: "_r_sharma",),
                                ],
                              ),
                            ),
                          ))))),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image(
                image: AssetImage(postimgpath),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
