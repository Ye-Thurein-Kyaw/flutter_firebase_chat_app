import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  static const route = "/";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
