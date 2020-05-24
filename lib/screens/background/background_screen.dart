import 'dart:io';

import 'package:facefinder/screens/complete_data/complete_data_content.dart';
import 'package:facefinder/screens/complete_data/complete_data_screen.dart';
import 'package:facefinder/screens/result/results_content.dart';
import 'package:facefinder/screens/result/results_screen.dart';
import 'package:facefinder/screens/select_pic/select_pic_content.dart';
import 'package:facefinder/screens/select_pic/select_pic_screen.dart';
import 'package:flutter/material.dart';

class BackgroundScreen extends StatefulWidget {
  @override
  _BackgroundScreenState createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen>  {

  int pageNumber;
  PageController pageController;

  File image;

  @override
  void initState() {
    pageNumber= 1;
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Image.asset('assets/texxtttt.png', width: 180,),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Text("$pageNumber Of 3" , style: TextStyle(color: Color(0xfffbaa29)),)),
                ),
                Expanded(
                  flex: 1,
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      SelectPicContent(toContentPage),
                      CompleteDataContent(changePage: toLastPage, getImage: getImage, backToMenu: backToMainPage,),
                      ResultContent(newSearch: backToMainPage,),
                    ],
                  ),
                ),
              ],
            ),
        ),
    );
  }



  void toContentPage(File file){
    image= file;
    setState(() {
      pageNumber= 2;
      pageController.animateToPage(1, duration: Duration(milliseconds: 1000), curve: Curves.easeOutCubic);
    });
  }
  File getImage(){
    return image;
  }

  void toLastPage(){
    setState(() {
      pageNumber = 3;
    });
    pageController.animateToPage(2, duration: Duration(milliseconds: 1000), curve: Curves.easeOutCubic);
  }

  void backToMainPage(){
    setState(() {
      pageNumber = 1;
    });
    pageController.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.easeOutCubic);
  }
}
