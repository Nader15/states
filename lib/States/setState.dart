import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:states/Api/api.dart';
import 'package:states/models/users_model.dart';

class SetStateScreen extends StatefulWidget {
  @override
  _SetStateScreenState createState() => _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SetState",
          style: style,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConditionalBuilder(
        condition: axisUsersList != null,
        builder: (context) => ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: axisUsersList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(axisUsersList[index].name),
              );
            }),
        fallback: (context) => Center(
          child: CircularProgressIndicator(),
        ),
          ),
        ),
      ),
    );
  }

  var style = TextStyle(fontSize: 20);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AxisUsersModel axisUsersModel;

  List<Success> axisUsersList = List();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () {
      gettingaxisUsersData();
    });
  }

  gettingaxisUsersData() {
    setState(() {
      Api().getAxisUsersApi(_scaffoldKey).then((value) {
        axisUsersModel = value;
        axisUsersModel.success.forEach((element) {
          setState(() {
            axisUsersList.add(element);
          });
        });
      });
    });
  }
}
