import 'package:api_user/model/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  Future<List<CommentModeal>> getComment() async {
    final response = http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/comments"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
