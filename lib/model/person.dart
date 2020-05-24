import 'dart:convert';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person{
  int id;
  String skinColor;
  String sex;
  String image;

  Person({this.id,this.sex,this.skinColor, File img}){
    image = base64Encode(img.readAsBytesSync());
  }

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

//_image= Image.memory(person.test(picture));

//Uint8List test(File file)  {
//  image =  base64Encode(file.readAsBytesSync());
//  Uint8List data =  base64Decode(image);
//  return data;
//}