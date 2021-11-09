import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/States/Provider/provider_screen.dart';
import 'package:states/States/Provider/provider_class.dart';
import 'package:states/States/setState.dart';
import 'package:states/home.dart';

import 'States/Provider/provider_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>CounterProvider()..gettingaxisUsersData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'States',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:ChangeNotifierProvider(
          create: (_)=>CounterProvider()..gettingaxisUsersData(),
          child: HomeScreen(),
          // child: ProviderScreen(),
          // child: SetStateScreen(),
        ),
      ),
      // child: ProviderScreen(),
      // child: SetStateScreen(),
    );
  }
}
