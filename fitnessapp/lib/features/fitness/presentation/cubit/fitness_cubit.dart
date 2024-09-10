import 'package:fitnessapp/features/fitness/domain/entities/fitness_metrics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitnessapp/features/fitness/domain/usecases/fetch_fitness_data.dart';

class FitnessCubit extends Cubit<FitnessState> {
  final FetchFitnessData fetchFitnessData;

  FitnessCubit(this.fetchFitnessData) : super(FitnessInitial());

  Future<void> loadFitnessData() async {
    emit(FitnessLoading());
    try {
      final fitnessData = await fetchFitnessData();
      emit(FitnessLoaded(fitnessData));
    } catch (e) {
      emit(FitnessError("Failed to load fitness data"));
    }
  }
}

abstract class FitnessState {}

class FitnessInitial extends FitnessState {}

class FitnessLoading extends FitnessState {}

class FitnessLoaded extends FitnessState {
  final FitnessData fitnessData;

  FitnessLoaded(this.fitnessData);
}

class FitnessError extends FitnessState {
  final String message;
  FitnessError(this.message);
}
