import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Api/api.dart';
import '../../models/users_model.dart';

class CounterProvider with ChangeNotifier{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AxisUsersModel axisUsersModel;

  List<Success> axisUsersList = List();

  gettingaxisUsersData() {
    Api().getAxisUsersApi(_scaffoldKey).then((value) {
      axisUsersModel = value;
      axisUsersModel.success.forEach((element) {
        axisUsersList.add(element);
      });
      notifyListeners();
    });

  }
}