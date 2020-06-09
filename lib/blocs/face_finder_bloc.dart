import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:facefinder/data_source/aws_source.dart';
import 'package:facefinder/model/person.dart';
import 'package:facefinder/model/person_response.dart';
import 'package:rxdart/rxdart.dart';

class FaceFindeBloc extends BlocBase{

  final AwsSource _awsSource;

  FaceFindeBloc(this._awsSource);

  BehaviorSubject<PersonResponse> _personResponseSubject = BehaviorSubject();
  Stream<PersonResponse> get personResponseObservable => _personResponseSubject.stream;

  Future awsConnection(Person person){
    _awsSource.getPersonImage(person).then(onValue).catchError(onError);
  }

  void onValue(PersonResponse personResponse){
    _personResponseSubject.add(personResponse);
  }

  void onError(){

  }

}