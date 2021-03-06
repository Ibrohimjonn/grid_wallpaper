import 'package:Grid_Wallpaper/Home_Page.dart';
import 'package:Grid_Wallpaper/full_img.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
      routes: {
        Home.id: (context) => Home(),
        FullIMG.id: (context) => FullIMG(),
      },
    );
  }
}

