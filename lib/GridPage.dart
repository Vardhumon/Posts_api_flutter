import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'PostItem.dart';

class GridPagee extends StatefulWidget {
  const GridPagee({Key? key});

  @override
  State<GridPagee> createState() => _GridPageState();
}

class _GridPageState extends State<GridPagee> {
  List<dynamic> posts = [];
  List<dynamic> images = [];

  @override
  void initState() {
    super.initState();
    getImages();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return images.length == 0 || posts.length == 0 ?
    Center(child: CircularProgressIndicator(),):
    Row(
      children: [
        ListView.builder(
          itemCount: posts.length ~/ 2,
          itemBuilder: (context, index) {
            final post = posts[index];
            final image = images[index];
            return PostItem(post: post, image: image);
          },
        ),
        ListView.builder(
          itemCount: posts.length ~/ 2,
          itemBuilder: (context, index) {
            final post = posts[index + (posts.length ~/ 2)];
            final image = images[index + (posts.length ~/ 2)];
            return PostItem(post: post, image: image);
          },
        ),
      ],
    );
  }

  void getPosts() async {
    const url = "https://jsonplaceholder.typicode.com/posts";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      posts = json;
    });
  }

  void getImages() async {
    const url = "https://picsum.photos/v2/list?page=2&limit=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      images = json;
    });
  }
}
