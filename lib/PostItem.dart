import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostItem extends StatelessWidget {
  final dynamic post;
  final dynamic image;

  PostItem({required this.post, required this.image});

  @override
  Widget build(BuildContext context) {
    final imageUri = image['download_url'];
    final title = post['title'];
    final body = post['body'];

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              child: Image(
                image: NetworkImage(imageUri),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(title,
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28, height: .9)),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  body,
                  style: GoogleFonts.dosis(
                      fontSize: 16, height: .9, fontWeight: FontWeight.w400),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
