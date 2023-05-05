import 'package:cat_trivia_test_task/model/fact.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'fact_api_service.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com/")
abstract class FactApiService {
  factory FactApiService(Dio dio, {String baseUrl}) = _FactApiService;

  @GET("facts/random")
  Future<Fact> getFact();
}