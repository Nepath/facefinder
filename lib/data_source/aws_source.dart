import 'package:dio/dio.dart';
import 'package:facefinder/model/person.dart';
import 'package:facefinder/model/person_response.dart';
import 'package:retrofit/http.dart';

part 'aws_source.g.dart';

@RestApi(baseUrl: 'http://ec2-54-236-111-100.compute-1.amazonaws.com')
abstract class AwsSource{

  factory AwsSource(Dio dio) = _AwsSource;

  @POST('/')
  Future<PersonResponse> getPersonImage(@Body() Person person);
}