import 'package:flutter/material.dart';

class ResultContent extends StatefulWidget {

  Function newSearch;

  ResultContent({this.newSearch});

  @override
  _ResultContentState createState() => _ResultContentState();
}

class _ResultContentState extends State<ResultContent> {

  Image img = Image.asset("assets/faces1.png", fit: BoxFit.fill,);

  String name = "Imie nazwisko";

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
                      child: Text("All the signs from the sky tells me that the name of your person is $name", style: TextStyle(fontSize: 20),)
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
