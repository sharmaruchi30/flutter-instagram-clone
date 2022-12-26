import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/bottom_navigation.dart';
import 'package:instagram_clone/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram clone',
       theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      
      home: const BottomNavigation(),
    );
  }
}

