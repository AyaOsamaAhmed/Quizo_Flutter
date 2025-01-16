import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "Home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Column(
        children: [
          Text("Home page")
        ],
      ),
    );
  }
}
