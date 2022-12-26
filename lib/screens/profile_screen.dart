import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/story_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> user_post_images = ['assets/images/user_post_1.png','assets/images/user_post_2.png','assets/images/user_post_3.png','assets/images/user_post_4.png','assets/images/user_post_5.png','assets/images/user_post_6.png','assets/images/user_post_7.png','assets/images/user_post_8.png','assets/images/user_post_9.png',];
  bool following = false;
  int nav_activeIndex = 0;
  int naav_previosIndex = 0;
  @override
  Widget build(BuildContext context) {
    print('Profile Screen build');
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
                    const Text(
                      'pieroborgo',
                      style: TextStyle(
                          fontFamily: 'sfpro',
                          fontWeight: FontWeight.w800,
                          fontSize: 24),
                    ),
                    Row(
                      children: const [
                        Image(image: AssetImage('assets/icons/new-video.png')),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const ClipOval(
                        child: Image(
                      image: AssetImage('assets/images/avatar.png'),
                      fit: BoxFit.cover,
                    )),

                    //Numbers
                    Column(
                      children: const [
                        Text(
                          '123',
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
                          '300',
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
                          '136',
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
                const Text(
                  'Piero Borgo',
                  style: TextStyle(
                      fontFamily: 'sfpro',
                      fontSize: 17,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                // ID BIO
                const Text(
                  "Product designer, founder of Leevia, lego bricks lover.",
                  style: TextStyle(fontSize: 16, fontFamily: 'sfpro'),
                ),
                //Links
                InkWell(
                  onTap: () async{
                    const url = 'https://www.leevia.com/';
                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Text(
                    'leevia.com',
                    style: TextStyle(color: Colors.blue[800], fontSize: 16),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          following = !following;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: MediaQuery.of(context).size.width / 2 - 40,
                        decoration: BoxDecoration(
                          color:following? Colors.transparent: const Color.fromARGB(255, 56, 152, 243),
                          borderRadius: BorderRadius.circular(6.0),
                          border: following? Border.all( color: Colors.black12 , width: 1.5): Border(),

                        ),
                        child:  Center(
                          child: Text(
                            following? "Following" : "Follow",
                            style: TextStyle(
                                color: following ? Colors.black: Colors.white,
                                fontSize: 16,
                                fontFamily: 'sfpro'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width / 2 - 40,
                  decoration: BoxDecoration(
                    // color:const Color.fromARGB(255, 56, 152, 243),
                    border: Border.all( color: Colors.black12 , width: 1.5),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: const Center(
                    child: Text(
                      "Message",
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
                    border: Border.all( color: Colors.black12 , width: 1.5),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child:Image(image: AssetImage('assets/icons/dropdown.png'))
                )
                  ],
                ),

                const SizedBox(height: 10,),
                //STORIES Circles

                Row(
                  children:  [
                     InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context )=> const StoryView()));
                      },
                       child: const ClipOval(
                        child: Image(image: AssetImage('assets/images/story_beach.png' ,) ,fit: BoxFit.cover , height: 70 , width: 70,),
                                         ),
                     ),
                    const SizedBox(width: 10,),
                    const ClipOval(
                      child: Image(image: AssetImage('assets/images/story_flower.png' ,) ,fit: BoxFit.cover , height: 70 , width: 70,),
                    ),
                    const SizedBox(width: 10,),
                    const ClipOval(
                      child: Image(image: AssetImage('assets/images/story_sky.png' ,) ,fit: BoxFit.cover , height: 70 , width: 70,),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
          //NAVIGATION
                Row(
                  children: [
                    user_post_nav(context , 0,'assets/icons/Gridbl.png','assets/icons/Gridgr.png'),
                    user_post_nav(context , 1,'assets/icons/Reelbl.png','assets/icons/Reelgr.png'),
                    user_post_nav(context , 2,'assets/icons/IGTVbl.png','assets/icons/IGTVgr.png'),
                    user_post_nav(context , 3,'assets/icons/Tagsbl.png','assets/icons/Tagsgr.png')
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
          SizedBox(
            height: 343,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ), 
            itemCount: user_post_images.length,
            itemBuilder: ((context, index) {
              return SizedBox(
                height: 200,
                width: 200,
                child: Image(image: AssetImage(user_post_images[index]) , fit: BoxFit.cover,),
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

  Widget user_post_nav(BuildContext context , index , String active_image_path , String inactive_image_path){
    return GestureDetector(
      onTap: (){
         setState(() {
        naav_previosIndex = nav_activeIndex;
      nav_activeIndex = index;
    });
      },
      child: Column(
        crossAxisAlignment: nav_activeIndex == index && naav_previosIndex < index?  CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
            
                          height: 40,
                          width: MediaQuery.of(context).size.width/4,
                          decoration: BoxDecoration(
                            // border: nav_activeIndex == index ? const Border(bottom: BorderSide(width: 2)): const Border() ,
                          ),
                          child:  Image(image: AssetImage(nav_activeIndex == index ? active_image_path : inactive_image_path)),
                          // child: const Icon(CupertinoIcons.square_grid_2x2 , size: 30,),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          // transform: Matrix4.identity()..translate(MediaQuery.of(context).size.width/16),
                          height: 2,
                          width: nav_activeIndex == index? MediaQuery.of(context).size.width/4: 0,
                          color: Colors.black,
                        )
        ],
      ),
    );
  }
}
