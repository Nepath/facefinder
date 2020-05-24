import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CompleteDataContent extends StatefulWidget {

  Function changePage;
  Function backToMenu;
  Function getImage;

  CompleteDataContent({this.changePage, this.backToMenu, this.getImage});

  @override
  _CompleteDataContentState createState() => _CompleteDataContentState();
}

class _CompleteDataContentState extends State<CompleteDataContent> {

  List<bool> _sexIsSelected = [false, true];
  List<bool> _skinColor = [false, true];


  Image _image;

  @override
  void initState() {
    setState(() {
      _image = Image.file(widget.getImage(), fit: BoxFit.fill,);
    });
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
              flex: 4,
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 0,
                      child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text("Your Character", style: TextStyle( fontSize: 24),))),
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
                            child: _image,
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
                      child: Row(
                        children: <Widget>[
                          Text("Sex:", style: TextStyle(fontSize: 20),),
                          Spacer(),
                          ToggleButtons(
                            children: <Widget>[
                              Container(
                                  width:70,
                                  child: Center(child: Text("Woman"))),
                              Container(
                                  width:70,
                                  child: Center(child: Text("Man"))),
                            ],
                            color: Colors.grey,
                            disabledColor: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                            selectedColor: Colors.black,
                            isSelected: _sexIsSelected,
                            fillColor: Color(0xfffbaa29),
                            onPressed: (int index) {
                              setState(() {
                                if(!_sexIsSelected[index]){
                                  _sexIsSelected[0] = !_sexIsSelected[0];
                                  _sexIsSelected[1] = !_sexIsSelected[1];
                                }
                              });
                            },
                          ),
                        ],
                      )
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20,),
                    child: Row(
                      children: <Widget>[
                        Text("Skin color:", style: TextStyle(fontSize: 20),),
                        Spacer(),
                        ToggleButtons(
                          children: <Widget>[
                            Container(
                                width:70,
                                child: Center(child: Text("Black"))),
                            Container(
                                width:70,
                                child: Center(child: Text("White"))),
                          ],
                          color: Colors.grey,
                          disabledColor: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          selectedColor: Colors.black,
                          isSelected: _skinColor,
                          fillColor: Color(0xfffbaa29),
                          onPressed: (int index) {
                            setState(() {
                              if(!_skinColor[index]){
                                _skinColor[0] = !_skinColor[0];
                                _skinColor[1] = !_skinColor[1];
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex:1,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: InkWell(
                            onTap: widget.backToMenu,
                            child: Container(
                              height: 50,
                              child: Center(child: Text("Cancel")),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
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
                      Expanded(
                        flex:2,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: InkWell(
                            onTap: (){widget.changePage();},
                            child: Container(
                              height: 50,
                              child: Center(child: Text("Confirm")),
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
