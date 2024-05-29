import 'package:flutter/material.dart';

import 'views/home/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        platform: TargetPlatform.iOS,
        fontFamily: "Poppins"
      ),
      home: const HomeView(),
    );
  }
}
