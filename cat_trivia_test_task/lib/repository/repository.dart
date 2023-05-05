import 'package:cat_trivia_test_task/model/fact.dart';
import 'package:cat_trivia_test_task/model/image_model.dart';
import 'package:cat_trivia_test_task/repository/remote/cat_image_api_service.dart';
import 'package:cat_trivia_test_task/repository/remote/fact_api_service.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class Repository {
  Repository() {
    Dio catImageDio = Dio();
    catImageDio.options.headers["x-api-key"] =
        "live_hvNqC0vrlJEvFY0SVx5pNaSSZgSdvj51fyIeXK48GE27X2WbVoQsjljkPhd1Vo5x";
    factApiService = FactApiService(Dio());
    catImageApiService = CatImageApiService(catImageDio);
  }

  late FactApiService factApiService;
  late CatImageApiService catImageApiService;

  Future<Fact> getFact() async {
    final factBox = await Hive.openBox("facts");
    final newFact = await factApiService.getFact();
    factBox.add(newFact);
    newFact.save();
    return factBox.getAt(factBox.length - 1);
  }

  Future<ImageModel> getImage() async {
    final images = await catImageApiService.getImages();
    return images.first;
  }
}
