import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Insta_Story extends StatelessWidget {
  bool isSelf;
  bool isLive;
  String img_path;
  String id_name;
  Insta_Story({
    Key? key,
    required this.isSelf,
    required this.isLive,
    required this.img_path,
    required this.id_name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 65.h,
                  width: 65.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    gradient: !isSelf
                        ? const LinearGradient(
                            colors: [
                                Color.fromARGB(255, 214, 10, 102),
                                Color.fromARGB(255, 235, 175, 77),
                                // ignore: prefer_const_constructors
                              ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)
                        : LinearGradient(
                            colors: const [Colors.white, Colors.white]),
                  ),
                  child: Align(
                    child: Container(
                      height: 60.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: Colors.white, width: 2)),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(img_path ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                if (isSelf)
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: Container(
                      height: 25.h,
                      width: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: const Image(
                          image: AssetImage('assets/icons/Add story.png')),
                    ),
                  )
                else if (isLive)
                  Positioned(
                    bottom: -5,
                    right: 24,
                    child: Container(
                      height: 16.h,
                      width: 28.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 214, 10, 102),
                                Color.fromARGB(255, 235, 175, 77),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft)),
                              child: Center(child: Text("LIVE" , style: TextStyle(color: Colors.white , fontSize: 12),) ,),
                    ),
                  )
                else
                  Container(),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              isSelf ? " Your Story" : id_name,
              style: TextStyle(
                  fontFamily: 'sfpro',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
