import 'package:flutter/material.dart';
import 'package:trivial_app/screens/screen_1.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const Screen1(),
    );
  }
}
