import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> user_post_images = [
    'assets/portraits/one.jpg',
    'assets/portraits/two.jpg',
    'assets/portraits/three.jpg',
    'assets/portraits/four.jpg',
    'assets/portraits/five.jpg',
    'assets/portraits/six.jpg',
    'assets/portraits/storymy3.jpg',
    'assets/portraits/storymy1.jpg',
    'assets/landscapes/retrocamera.jpg',
    'assets/landscapes/laptop.jpg',
    'assets/landscapes/hpexpress.jpg',
    'assets/landscapes/hpdiary.jpg',
    'assets/landscapes/retrocamera2.jpg',
    'assets/landscapes/train.jpg',
    'assets/portraits/hpplatform.jpg',
    'assets/portraits/hpout.jpg',
  ];
  final random = Random();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
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
              ),
              const SizedBox(
                height: 16,
              ),
              
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 180,
                  child: GridView.custom(
                    gridDelegate: SliverQuiltedGridDelegate(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      repeatPattern: QuiltedGridRepeatPattern.inverted,
                      pattern: [
                        const QuiltedGridTile(2, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                        const QuiltedGridTile(1, 1),
                      ],
                    ),
                    
                    childrenDelegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                        height: 50,
                        width: 50,
                        child: Image(image: AssetImage(user_post_images[random.nextInt(user_post_images.length)]), fit: BoxFit.cover,)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
