import 'package:flutter/material.dart';

class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents(
      {required this.title, required this.image, required this.desc});
}

List<OnboardingContents> conten1 = [
  OnboardingContents(
    title: "Firsto Allewin Nurhasan",
    image: "assets/images/image1.png",
    desc: "19103046",
  ),
  OnboardingContents(
    title: "Arlin Satiaji",
    image: "assets/images/image2.png",
    desc: "19103026",
  ),
  OnboardingContents(
    title: "Fiqih Tri Eko F.",
    image: "assets/images/image3.png",
    desc: "19103033",
  ),
  OnboardingContents(
    title: "Diki Irfandi Rosyid",
    image: "assets/images/image4.png",
    desc: "19103138",
  ),
];
