import 'dart:convert';

import 'package:api_user/model/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  List<CommentModeal> commentKist = [];
  Future<List<CommentModeal>> getComment() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/comments"),
    );
    var dtata = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in dtata) {
        commentKist.add(CommentModeal.fromJson(i));
      }

      return commentKist;
    }
    return commentKist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Center(child: Text("API"))),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getComment(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No data found"));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length, // ❌ Missing chilo
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(item.postId.toString()),
                          ),
                          title: Text(item.name.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email: ${item.email}"),
                              Text(item.body.toString()),
                            ],
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
