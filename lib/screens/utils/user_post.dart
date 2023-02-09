import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:provider/provider.dart';

import 'package:instagram_clone/providers/home_screen_provider.dart';
import 'package:instagram_clone/screens/comments_screen.dart';

class UserPost extends StatefulWidget {
  String image_path;
  String username;
  String userProfile;
  UserPost({
    Key? key,
    required this.image_path,
    required this.username,
    required this.userProfile,
  }) : super(key: key);

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late final homeScreenProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeScreenProvider =
          Provider.of<HomeScreenProvider>(context, listen: false);
    });
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _scaleAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 1.2), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 1.2, end: 1.0), weight: 50),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        homeScreenProvider.setLike(true);
      }
      if (status == AnimationStatus.dismissed) {
        homeScreenProvider.setLike(false);
      }
    });
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(530),
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.grey.shade300),
            bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ProfileScreen(
                                selfProfile: false,
                                bio: "Bio Text here",
                                user_post_images: const [
                                  'assets/portraits/one.jpg',
                                  'assets/portraits/two.jpg',
                                 'assets/portraits/three.jpg',
                                 'assets/portraits/five.jpg'
                                ], 
                                user_profile: widget.userProfile,
                                username: widget.username, display_name: 'user',
                                )
                                )
                                )
                                );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(widget.userProfile),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.username,
                            style: TextStyle(
                              fontFamily: 'sfpro',
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            "Jodhpur",
                            style: TextStyle(
                              fontFamily: 'sfpro',
                              // fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_horiz,
                  size: 24,
                )
              ],
            ),
          ),

          /// Slider HERE
          //Image
          GestureDetector(
            onDoubleTap: () {
              homeScreenProvider.liked
                  ? _controller.reverse()
                  : _controller.forward();
            },
            child: SizedBox(
              width: ScreenUtil().screenWidth,
              height: 370.h,
              child: Image(
                image: AssetImage(widget.image_path),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(onTap: () {
                      // homeScreenProvide.setLike();
                      homeScreenProvider.liked
                          ? _controller.reverse()
                          : _controller.forward();
                    }, child: Consumer<HomeScreenProvider>(
                        builder: ((context, value, child) {
                      if (value.liked) {
                        return AnimatedBuilder(
                          animation: _controller,
                          builder: (context, _) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.red.shade700,
                                size: 30,
                              ),
                            );
                          },
                        );
                      } else {
                        return AnimatedBuilder(
                          animation: _controller,
                          builder: (context, _) {
                            return Transform.scale(
                                scale: _scaleAnimation.value,
                                child: const Icon(
                                  CupertinoIcons.heart,
                                  size: 30,
                                ));
                          },
                        );
                      }
                    }))),
                    const SizedBox(
                      width: 11,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommentsPage()));
                      },
                      child: const SizedBox(
                          height: 20,
                          width: 20,
                          child: Image(
                              image: AssetImage('assets/icons/comment.png'))),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      child: const SizedBox(
                          height: 23,
                          width: 23,
                          child: Image(
                              image: AssetImage('assets/icons/share.png'))),
                    ),
                  ],
                ),
                GestureDetector(
                  child: const SizedBox(
                      height: 28,
                      width: 28,
                      child: Image(image: AssetImage('assets/icons/save.png'))),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: -20,
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundImage: AssetImage(widget.userProfile),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -10,
                          child: Container(
                            height: 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundImage: AssetImage(widget.userProfile),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundImage: AssetImage(widget.userProfile),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Liked by ',
                        style:
                            TextStyle(color: Colors.black, fontFamily: 'sfpro'),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'ruchi_30 ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'and '),
                          TextSpan(
                            text: 'others ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "pieroborgo",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: 'sfpro'),
                    ),
                    Text(" This is sample caption text.. Some more")
                  ],
                ),
                Text(
                  " #instagram #flutter #dart",
                  style: TextStyle(color: Colors.blue.shade300),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
