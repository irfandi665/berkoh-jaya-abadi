import 'package:PostNews/about/onboarding_screen.dart';
import 'package:PostNews/crud/homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:PostNews/view/drawer.dart';
import 'package:PostNews/view/widget/card_widget.dart';
import 'package:shimmer/shimmer.dart';

class ArticlesPage extends StatelessWidget {
  ArticlesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Articles",
          style: TextStyle(color: Colors.red[700], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnboardingScreen()),
                  );
                },
                icon: Image.asset('images/icon_user.png')),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: HomePage(),
      drawer: DrawerMenu(),
    );
  }
}
