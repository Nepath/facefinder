import 'dart:typed_data';
import 'dart:convert';
import 'package:facefinder/model/person_response.dart';
import 'package:flutter/material.dart';
import 'dart:io' as Io;

class ResultContent extends StatefulWidget {

  Function newSearch;
  Function personResponse;

  ResultContent({this.newSearch, this.personResponse});

  @override
  _ResultContentState createState() => _ResultContentState();
}

class _ResultContentState extends State<ResultContent> {

  Image img = Image.asset("assets/faces1.png", fit: BoxFit.fill,);

  String name = "Your character name is...";
  PersonResponse person;

  @override
  void initState() {
    this.person = widget.personResponse();
      Uint8List data =  base64Decode(person.image);
    img = Image.memory(data, fit: BoxFit.fill,);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffafafa),
        borderRadius: BorderRadius.only(topRight:Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 8,
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 0,
                      child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(name, style: TextStyle( fontSize: 24, color: Color(0xfffbaa29)),))),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: img,
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
          Expanded(
              flex: 0,
              child: Divider(thickness: 3,)),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Damn, nice picture bro! Wanna search for another guy? ha?", style: TextStyle(fontSize: 20, ),textAlign: TextAlign.center)
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,),
                    child: Text("Press button bellow for new search", style: TextStyle(fontSize: 12),),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      onTap: (){widget.newSearch();},
                      child: Container(
                        height: 50,
                        child: Center(child: Text("New search")),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xfffbaa29),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(7,7),
                              )
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
