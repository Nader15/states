import 'package:flutter/material.dart';
import 'package:states/utils/colors.dart';
import 'package:states/utils/navigation.dart';

import '../States/Provider/provider_screen.dart';
import '../States/setState.dart';

TextStyle fontStyle = TextStyle(color: Colors.white);
TextStyle sectionsStyle = TextStyle(color: Colors.black,fontSize: 20);

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          // color: primaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Column(
                children: [
                  DrawerHeader(
                    child: Center(),
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  navigateAndKeepStack(context, SetStateScreen());
                },
                trailing: Icon(Icons.arrow_forward),
                title: Text(
                  "SetState",
                  style: sectionsStyle,
                ),
              ),
              ListTile(
                onTap: () {
                  navigateAndKeepStack(context, ProviderScreen());
                },
                trailing: Icon(Icons.arrow_forward),
                title: Text(
                  "provider",
                  style: sectionsStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
