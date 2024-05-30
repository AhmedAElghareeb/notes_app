import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';

import 'views/home/view.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(notesBox);

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
          fontFamily: "Poppins"),
      home: const HomeView(),
    );
  }
}
