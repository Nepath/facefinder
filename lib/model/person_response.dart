import 'package:json_annotation/json_annotation.dart';

part 'person_response.g.dart';

@JsonSerializable()
class PersonResponse{

  @JsonKey(name: 'wynik')
  String image;

  PersonResponse(this.image);

  factory PersonResponse.fromJson(Map<String, dynamic> json) => _$PersonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PersonResponseToJson(this);
}