import 'dart:async';
import 'dart:io';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:facefinder/blocs/face_finder_bloc.dart';
import 'package:facefinder/model/person.dart';
import 'package:facefinder/model/person_response.dart';
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
  Person person;
  File image;
  PersonResponse _personResponse;
  FaceFindeBloc _faceFindeBloc;
  StreamSubscription _streamSubscription;

  @override
  void initState() {
    pageNumber= 1;
    pageController = PageController(initialPage: 0);
    super.initState();
    _faceFindeBloc = BlocProvider.getBloc();
    _streamSubscription = _faceFindeBloc.personResponseObservable.listen(onData);
  }

  void onData(PersonResponse personResponse){
    _personResponse=personResponse;
    pageController.animateToPage(2, duration: Duration(milliseconds: 1000), curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
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
                      ResultContent(newSearch: backToMainPage, personResponse: getPersonResponse),
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

  void toLastPage(bool sex, bool race){
    setState(() {
      pageNumber = 3;
    });
    person = Person(img: image, sex: sex, race: race,);
    _faceFindeBloc.awsConnection(person);

  }

  void backToMainPage(){
    setState(() {
      pageNumber = 1;
    });
    pageController.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.easeOutCubic);

  }

  PersonResponse getPersonResponse(){
    return _personResponse;
  }
}
