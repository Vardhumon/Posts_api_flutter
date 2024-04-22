import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Posts extends StatefulWidget {
    Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
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
    return images.isEmpty || posts.isEmpty
        ?   Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: posts.length ~/ 2,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      final image = images[index];
                      final image_uri = image['download_url'];
                      final title = post['title'];
                      final body = post['body'];

                      return Container(
                        margin:   EdgeInsets.all(10),
                        padding:   EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(3, 0),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:    BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset:   Offset(0, 3),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius:   BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                child: Image.network(
                                  image_uri,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:   EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    title,
                                    style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 28,
                                      height: .9,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:   EdgeInsets.all(4.0),
                                  child: Text(
                                    body,
                                    style: GoogleFonts.dosis(
                                      fontSize: 16,
                                      height: .9,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: posts.length ~/ 2,
                    itemBuilder: (context, index) {
                      final post = posts[index + (posts.length ~/ 2)];
                      final image = images[index + (posts.length ~/ 2) ];
                      final image_uri = image['download_url'];
                      final title = post['title'];
                      final body = post['body'];

                      return Container(
                        margin:   EdgeInsets.all(10),
                        padding:   EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(3, 0),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:   BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius:   BorderRadius.only(
                                  topLeft: Radius.circular(18),
                                  topRight: Radius.circular(18),
                                ),
                                child: Image(
                                  image: NetworkImage(image_uri, scale: 0.5),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:   EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    title,
                                    style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 28,
                                      height: .9,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:   EdgeInsets.all(4.0),
                                  child: Text(
                                    body,
                                    style: GoogleFonts.dosis(
                                      fontSize: 16,
                                      height: .9,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
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
    const  url = "https://picsum.photos/v2/list?page=2&limit=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      images = json;
    });
  }
}
