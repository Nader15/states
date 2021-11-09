import 'package:flutter/material.dart';
import 'package:states/utils/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(),
      body: Center(child: Text("HOME"),),
    );
  }
}
