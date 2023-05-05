import 'package:cat_trivia_test_task/model/image_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'cat_image_api_service.g.dart';

@RestApi(baseUrl: "https://api.thecatapi.com/v1/")
abstract class CatImageApiService {
  factory CatImageApiService(Dio dio, {String baseUrl}) = _CatImageApiService;

  @GET("images/search")
  Future<List<ImageModel>> getImages();
}