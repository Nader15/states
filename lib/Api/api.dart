import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:states/models/users_model.dart';
import 'package:xs_progress_hud/xs_progress_hud.dart';

class Api {
  String baseUrl = 'http://mohp.mpa-media.com/api/';
   BuildContext context;

  Future getAxisUsersApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + "users";
    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer 5M2O0N84FBJHkhmQDSHJWCMQ5w4LmVvhlz1dtVJh"
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print("Axises Users Api Data : ${dataContent}");
      return AxisUsersModel.fromJson(dataContent);
    } else {
      print("Axises Users Api Data : ${dataContent}");
      // CustomSnackBar(_scaffoldKey, json.decode(response.body).toString());
      return false;
    }
  }
}
