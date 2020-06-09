// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aws_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AwsSource implements AwsSource {
  _AwsSource(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://ec2-54-236-111-100.compute-1.amazonaws.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getPersonImage(person) async {
    ArgumentError.checkNotNull(person, 'person');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(person?.toJson() ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request('/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = PersonResponse.fromJson(_result.data);
    return value;
  }
}
