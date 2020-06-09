import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:progress_dialog/progress_dialog.dart';


class SelectPicContent extends StatefulWidget {

  Function changePage;
  SelectPicContent(this.changePage);

  @override
  _SelectPicContentState createState() => _SelectPicContentState();
}

class _SelectPicContentState extends State<SelectPicContent> {

  ProgressDialog progressDialog;
  File file;
  Image _image;

  Future selectImageFromGallery() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    if(picture!=null) {
      file = picture;
      widget.changePage(picture);
    }
  }

  Future selectImageFromCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    if(picture!=null) {
      file = picture;
      widget.changePage(picture);
    }
  }
  
  @override
  void initState() {
    _image = Image.asset('assets/faces1.png',  fit: BoxFit.fill,);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
        message: "Wczytywanie..."
    );

    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffafafa),
        borderRadius: BorderRadius.only(topRight:Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: _image,
              ),
            )
          ),
          Expanded(
              flex: 0,
              child: Divider(thickness: 3,)),
          Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Welcome Back!", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20,),
                      child: Text("Please select option to choose which character you want to recognize!", style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),),
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
                            onTap: (){selectImageFromGallery();},
                            child: Container(
                              height: 50,
                              child: Center(child: Text("Gallery")),
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
                      Expanded(
                        flex:1,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: InkWell(
                            onTap: (){selectImageFromCamera();},
                            child: Container(
                              height: 50,
                              child: Center(child: Text("Camera")),
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
