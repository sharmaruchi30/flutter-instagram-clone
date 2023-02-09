import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/home_screen_provider.dart';
import 'package:instagram_clone/providers/profile_screen_provider.dart';
import 'package:instagram_clone/screens/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(
            create: (__) => HomeScreenProvider(),
          )
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
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
            }));
  }
}
