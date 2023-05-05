import 'package:cat_trivia_test_task/model/fact.dart';
import 'package:cat_trivia_test_task/model/image_model.dart';

abstract class FactBlocState {}

class FactBlocStateEmpty extends FactBlocState {}

class FactBlocStateLoading extends FactBlocState {}

class FactBlocStateData extends FactBlocState {
  FactBlocStateData({required this.fact, required this.image,});

  final Fact fact;
  final ImageModel image;
}

class FactBlocStateError extends FactBlocState {
  final Object error;

  FactBlocStateError(this.error);
}
