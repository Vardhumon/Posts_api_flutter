// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:posts_api/grid.dart';
import 'package:posts_api/pages/addpage.dart';
import 'package:posts_api/pages/notifications.dart';
import 'package:posts_api/pages/profile.dart';
import 'package:posts_api/pages/search.dart';
import 'package:posts_api/posts.dart';
import 'package:posts_api/posts_an.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey,
      appBarTheme: AppBarTheme(color: Colors.grey)
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedindex=0;
  @override
  Widget build(BuildContext context) {
    
    List <dynamic> pages =[
      Posts(),
      Searchpage(),
      UploadPage(),
      NotiPage(),
      ProfilePage()
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
            elevation: 5,
            leading: Icon(Icons.menu),
            shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
            title: Center(
              child: Text(
                "Dolce & Gabbana",
                style:
                    GoogleFonts.dmSerifDisplay(fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
            ]),

      body: pages[selectedindex],
      bottomNavigationBar: Container(
        
          // margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,  
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(0,10)
            )
          ]        
          ),
          margin: EdgeInsets.symmetric(vertical:10,horizontal: 20),
          padding: EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: GNav(
              onTabChange: (index){
      
                setState(() {
                  selectedindex = index;
                  
                }
                );
              },
              tabs: [
              
              GButton(icon: Icons.home, text: "Home",),
              GButton(icon: Icons.search, text: "Search",),
              GButton(icon: Icons.add, text: "Add",),
              GButton(icon: Icons.message, text: "Messages",),
              GButton(icon: Icons.person, text: "Profile",),
            
            
            ],padding: EdgeInsets.all(15),
            gap: 8,
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.black26,
            
            ),
          ),
        )
    );
  }
}