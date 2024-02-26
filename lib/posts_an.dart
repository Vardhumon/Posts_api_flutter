    // ignore: file_names
    import 'dart:convert';
    import 'dart:math';

    import 'package:flutter/material.dart';
    import 'package:google_fonts/google_fonts.dart';
    import 'package:google_nav_bar/google_nav_bar.dart';
    import 'package:http/http.dart' as http;

    // ignore: camel_case_types
    class homePage extends StatefulWidget {
      const homePage({super.key});

      @override
      State<homePage> createState() => _homePageState();
    }

    class _homePageState extends State<homePage> {
      List<dynamic> posts = [];
      @override
      void initState() {
        super.initState();
        getPosts();
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  "Cheat Chat",
                  style: GoogleFonts.raleway(),
                ),
              ),
              backgroundColor: Colors.blueAccent,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5.0,
              shadowColor: Colors.black,
              leading: Icon(Icons.search),
              actions: [
                Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
                Padding(padding: EdgeInsets.only(right: 20)),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.dribbble.com/users/458522/screenshots/3230273/media/acf3e38fa5dd30d03b515e145b901cd2.jpg"),
                ),
                Padding(padding: EdgeInsets.only(right: 10)),
              ],
            ),
            body: Container(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    final int userId = post['userId'];
                    final id = post['id'];
                    final title = post['title'];
                    final body = post['body'];

                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(-5, 5),
                                blurRadius: 12.0)
                          ]),
                      child: Column(
                        children: [
                          Text(title),
                          Text(body)
                        ],
                      ),
                    );
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: getPosts,
              child: Icon(Icons.download),
            ));
      }

      double randomWidth() {
        final x = Random().nextDouble() * 200;

        return x;
      }

      double randomheigth() {
        final x = Random().nextDouble() * 200 + 100;
        return x;
      }

      void getPosts() async{
        const url = "https://jsonplaceholder.typicode.com/posts";
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        print("users fetched");

        setState(() {
          posts = json;
        });
      }
    }