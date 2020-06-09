import 'dart:convert';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person{

  @JsonKey(name: 'img')
  String image;

  @JsonKey(name: 'mode')
  String mode;

  Person({File img, bool sex, bool race}){
    this.mode = modeSelector(sex, race);
    final String helper = ",${base64Encode(img.readAsBytesSync())}";
    this.image = helper;
  }

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  String modeSelector(bool sex, bool race){
    if(sex && race){
      return "white_men";
    }
    else if (sex && !race){
      return "other_men";
    }
    else if (!sex && race){
      return "white_women";
    }
    else if (!sex && !race){
      return "other_women";
    }
  }
}

//_image= Image.memory(person.test(picture));

//Uint8List test(File file)  {
//  image =  base64Encode(file.readAsBytesSync());
//  Uint8List data =  base64Decode(image);
//  return data;
//}