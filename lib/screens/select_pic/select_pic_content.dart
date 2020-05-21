import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class SelectPicContent extends StatefulWidget {
  @override
  _SelectPicContentState createState() => _SelectPicContentState();
}

class _SelectPicContentState extends State<SelectPicContent> {

  File file;

  Future test1() async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      file= picture;
    });
  }

  Future test() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      file=picture;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: file == null ? Text("xd") : Image.file(file),
            )
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              onPressed: test1,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
