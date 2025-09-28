import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApiScreen extends StatefulWidget {
  const UserApiScreen({super.key});

  @override
  State<UserApiScreen> createState() => _UserApiScreenState();
}

class _UserApiScreenState extends State<UserApiScreen> {
  // Remove class-level 'data'

  // Corrected: return List<dynamic> instead of void
  Future<List<dynamic>> getUser() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // return list of users
    } else {
      throw Exception("Failed to load users");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("API Course")),
      body: FutureBuilder<List<dynamic>>(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            var data = snapshot.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Column(
                    children: [
                      Text(data[0]["name"].toString()),
                      SizedBox(height: 20),
                      Text(data[0]["username"].toString()),
                      SizedBox(height: 20),

                      Text(
                        data[0]["email"].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ); // first user's name
          } else {
            return const Center(child: Text("No data"));
          }
        },
      ),
    );
  }
}
