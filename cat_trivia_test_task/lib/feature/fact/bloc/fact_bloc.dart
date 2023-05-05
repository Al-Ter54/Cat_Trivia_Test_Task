import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc_event.dart';
import 'package:cat_trivia_test_task/feature/fact/bloc/fact_bloc_state.dart';
import 'package:cat_trivia_test_task/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactBloc extends Bloc<FactBlocEvent, FactBlocState> {
  FactBloc({
    required this.repository,
  }) : super(FactBlocStateEmpty()) {
    on<FactBlocEventInit>(_onInit);
    on<FactBlocEventLoad>(_onLoad);
  }

  final Repository repository;

  Future<void> _onInit(
    FactBlocEvent event,
    Emitter<FactBlocState> emit,
  ) async {
    //emit(FactBlocStateEmpty()); // For default empty state. Can be replaced with try-catch code
    try {
      emit(FactBlocStateLoading());
      final fact = await repository.getFact();
      final image = await repository.getImage();
      emit(FactBlocStateData(
        fact: fact,
        image: image,
      ));
    } catch (error) {
      emit(FactBlocStateError(error));
    }
  }

  Future<void> _onLoad(
    FactBlocEvent event,
    Emitter<FactBlocState> emit,
  ) async {
    try {
      emit(FactBlocStateLoading());
      final fact = await repository.getFact();
      final image = await repository.getImage();
      emit(FactBlocStateData(
        fact: fact,
        image: image,
      ));
    } catch (error) {
      emit(FactBlocStateError(error));
    }
  }
}
