import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentPhotoes extends StatefulWidget {
  const CommentPhotoes({super.key});

  @override
  State<CommentPhotoes> createState() => _CommentPhotoesState();
}

class _CommentPhotoesState extends State<CommentPhotoes> {
  @override
  Widget build(BuildContext context) {
    
  List<Photos> photoList = [];
  Future<List<Photos> getPhotoApi() async{
    final reponse = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    
  }
    return Scaffold(
      appBar: AppBar(title: Text("Photos")),
      body: Column(children: []),
    );
  }
}

class Photos{
  
}