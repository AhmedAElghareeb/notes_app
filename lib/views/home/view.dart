import 'package:flutter/material.dart';

import 'widgets/body.dart';
import 'widgets/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NotesBody()),
    );
  }
}



