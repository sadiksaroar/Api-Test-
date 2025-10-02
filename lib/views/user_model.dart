import 'dart:convert';

import 'package:api_user/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserModel extends StatefulWidget {
  const UserModel({super.key});

  @override
  State<UserModel> createState() => _UserModelState();
}

class _UserModelState extends State<UserModel> {
  @override
  Widget build(BuildContext context) {
    List<userModel> userList = [];
    Future<List<userModel>> getUserAPI() async {
      final respone = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
      );
      final data = jsonDecode(respone.body.toString());

      if (respone.statusCode == 200) {
        for (Map<String, dynamic> i in data) {
          userList.add(userModel.fromJson(i));
        }
        return userList;
      } else {
        return userList;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Center(child: Text("User Model ")),
      ),
      body: Column(children: [
        Expanded(child: )
      ],),
    );
  }
}
