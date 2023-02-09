import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:instagram_clone/providers/profile_screen_provider.dart';
import 'package:instagram_clone/screens/story_view.dart';
import 'package:instagram_clone/screens/utils/user_post.dart';

class ProfileScreen extends StatefulWidget {
  bool selfProfile;
  String username;
  String display_name;
  String user_profile;
  String bio;
  List<String> user_post_images;
  ProfileScreen({
    Key? key,
    required this.selfProfile,
    required this.username,
    required this.display_name,
    required this.user_profile,
    required this.bio,
    required this.user_post_images,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // List<String> user_post_images = [
  //   'assets/portraits/storymy3.jpg',
  //   'assets/portraits/storymy1.jpg',
  //   'assets/landscapes/retrocamera.jpg',
  //   'assets/landscapes/laptop.jpg',
  //   'assets/landscapes/hpexpress.jpg',
  //   // 'assets/landscapes/hpdiary.jpg',
  //   // 'assets/landscapes/retrocamera2.jpg',
  //   'assets/landscapes/train.jpg',
  //   // 'assets/portraits/hpplatform.jpg',
  //   // 'assets/portraits/hpout.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    print('Profile Screen build');

    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.username,
                      style:const TextStyle(
                          fontFamily: 'sfpro',
                          fontWeight: FontWeight.w800,
                          fontSize: 24),
                    ),
                    Row(
                      children: const [
                        Image(image: AssetImage('assets/icons/post.png'), height: 22,),
                        SizedBox(
                          width: 30,
                        ),
                        Image(image: AssetImage('assets/icons/menu.png'))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundImage: AssetImage(
                        widget.user_profile,
                      ),
                    ),

                    //Numbers
                    Column(
                      children: const [
                        Text(
                          '12',
                          style: TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'posts',
                          style: TextStyle(fontFamily: 'sfpro', fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          '26',
                          style: TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'followers',
                          style: TextStyle(fontFamily: 'sfpro', fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          '32',
                          style: TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'followings',
                          style: TextStyle(fontFamily: 'sfpro', fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                //Id Name
                 Text(
                  widget.display_name,
                  style:const TextStyle(
                      fontFamily: 'sfpro',
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                // ID BIO
                Text(
                  widget.bio,
                  style: const TextStyle(fontSize: 16, fontFamily: 'sfpro'),
                ),
                //Links
                InkWell(
                  onTap: () {},
                  child: Text(
                    // 'https://www.linkedin.com/in/ruchi-s-211436223/',
                    'twitter',
                    style: TextStyle(color: Colors.blue[800], fontSize: 16),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    !widget.selfProfile
                        ? GestureDetector(onTap: () {
                            profileProvider.setFollowing();
                          }, child: Consumer<ProfileProvider>(
                            builder: (context, value, child) {
                              return Container(
                                height: 35,
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                decoration: BoxDecoration(
                                  color: value.following
                                      ? Colors.transparent
                                      : const Color.fromARGB(255, 56, 152, 243),
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: value.following
                                      ? Border.all(
                                          color: Colors.black12, width: 1.5)
                                      : Border(),
                                ),
                                child: Center(
                                  child: Text(
                                    value.following ? "Following" : "Follow",
                                    style: TextStyle(
                                        color: value.following
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'sfpro'),
                                  ),
                                ),
                              );
                            },
                          ))
                        : Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            decoration: BoxDecoration(
                              // color:const Color.fromARGB(255, 56, 152, 243),
                              border:
                                  Border.all(color: Colors.black12, width: 1.5),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: const Center(
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(
                                    // color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'sfpro'),
                              ),
                            ),
                          ),
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      decoration: BoxDecoration(
                        // color:const Color.fromARGB(255, 56, 152, 243),
                        border: Border.all(color: Colors.black12, width: 1.5),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Share Profile",
                          style: TextStyle(
                              // color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'sfpro'),
                        ),
                      ),
                    ),
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          // color:const Color.fromARGB(255, 56, 152, 243),
                          border: Border.all(color: Colors.black12, width: 1.5),
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Image(
                            image: AssetImage('assets/icons/dropdown.png')))
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                //STORIES Circles

                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoryView(
                                      imgPath: "assets/portraits/storymy4.jpg",
                                    )));
                      },
                      child: const ClipOval(
                        child: Image(
                          image: AssetImage(
                            'assets/profile2.jpg',
                          ),
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const ClipOval(
                      child: Image(
                        image: AssetImage(
                          'assets/profile4.jpg',
                        ),
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const ClipOval(
                      child: Image(
                        image: AssetImage(
                          'assets/profile5.jpg',
                        ),
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //NAVIGATION
          Row(
            children: [
              user_post_nav(context, 0, 'assets/icons/Gridbl.png'),
              user_post_nav(context, 1, 'assets/icons/reels.png'),
              user_post_nav(context, 2, 'assets/icons/IGTV.png'),
              user_post_nav(context, 3, 'assets/icons/Tagsbl.png')
              // Container(
              //   height: 40,
              //   width: MediaQuery.of(context).size.width/4,
              //   decoration: const BoxDecoration(
              //     // border: Border(bottom: BorderSide(width: 2)),
              //   ),
              //   child: const Image(image: AssetImage('assets/icons/Reel.png')),
              //   // child: const Icon(CupertinoIcons.bolt_horizontal_circle , size: 30,),
              // ),
              // Container(
              //   height: 40,
              //   width: MediaQuery.of(context).size.width/4,
              //   decoration: const BoxDecoration(
              //     // border: Border(bottom: BorderSide(width: 2)),
              //   ),
              //   child: const Image(image: AssetImage('assets/icons/IGTV.png')),
              //   // child: const Icon(CupertinoIcons.rectangle_on_rectangle_angled , size: 30,),
              // ),
              // Container(
              //   height: 40,
              //   width: MediaQuery.of(context).size.width/4,
              //   decoration: const BoxDecoration(
              //     // border: Border(bottom: BorderSide(width: 2)),
              //   ),
              //   child: const Image(image: AssetImage('assets/icons/Tags.png')),
              //   // child: const Icon(CupertinoIcons.tags , size: 30,),
              // ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            height: 343,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: widget.user_post_images.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, 
                    MaterialPageRoute(builder: ((context) {
                      return Scaffold(
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
                                  UserPost(image_path:widget.user_post_images[index] , userProfile: "assets/profile_.jpg", username: "_r_sharma",),
                                ],
                              ),
                            ),
                          );
                    
                          
                    }))
                    ),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(
                        image: AssetImage(widget.user_post_images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                })),
          )
          // SizedBox(
          //   height: 200,
          //   width: MediaQuery.of(context).size.width,
          //   child: Expanded(child:
          //   SingleChildScrollView(
          //     child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3,
          //     ),
          //     itemCount: 9,
          //     itemBuilder: ((context, index) {
          //       return Container(
          //         height: 200,
          //         width: 200,
          //       );
          //     })),
          //   ),
          //   ),
          // ),
        ],
      )),
    );
  }

  Widget user_post_nav(BuildContext context, index, String activeImagePath) {
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return GestureDetector(onTap: () {
      profileProvider.setNavPreviousIndex(profileProvider.nav_activeIndex);
      profileProvider.setNavActiveIndex(index);
      //      setState(() {
      //     naav_previosIndex = nav_activeIndex;
      //   nav_activeIndex = index;
      // });
    }, child: Consumer<ProfileProvider>(
      builder: (context, value, child) {
        if (value.nav_activeIndex == index &&
            value.nav_previosIndex < value.nav_activeIndex) {
          return nav_underline_animation(value, index, activeImagePath,
              const Duration(milliseconds: 400), CrossAxisAlignment.start);
        } else if (value.nav_activeIndex == index &&
            value.nav_previosIndex > value.nav_activeIndex) {
          return nav_underline_animation(value, index, activeImagePath,
              const Duration(milliseconds: 400), CrossAxisAlignment.end);
        } else {
          if (value.nav_previosIndex < value.nav_activeIndex) {
            return nav_underline_animation(value, index, activeImagePath,
                const Duration(milliseconds: 400), CrossAxisAlignment.end);
          } else {
            return nav_underline_animation(value, index, activeImagePath,
                const Duration(milliseconds: 400), CrossAxisAlignment.start);
          }
        }
      },
    ));
  }

  // ignore: non_constant_identifier_names
  Column nav_underline_animation(ProfileProvider value, index,
      String activeImagePath, Duration duration, CrossAxisAlignment csa) {
    return Column(
      crossAxisAlignment: csa,
      children: [
        Container(
          height: 30,
          width: MediaQuery.of(context).size.width / 4,
          decoration: const BoxDecoration(
              // border: nav_activeIndex == index ? const Border(bottom: BorderSide(width: 2)): const Border() ,
              ),
          child: Image(
            // height: 20,
            image: AssetImage(activeImagePath),            
            color: value.nav_activeIndex == index ? Colors.black : Colors.grey,

          ),
          // child: const Icon(CupertinoIcons.square_grid_2x2 , size: 30,),
        ),
        AnimatedContainer(
          duration: duration,
          // transform: Matrix4.identity()..translate(MediaQuery.of(context).size.width/16),
          height: 2,
          width: value.nav_activeIndex == index
              ? MediaQuery.of(context).size.width / 4
              : 0,
          color: Colors.black,
        )
      ],
    );
  }
}
