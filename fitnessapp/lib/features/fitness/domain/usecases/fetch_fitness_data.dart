import 'package:fitnessapp/features/fitness/domain/entities/fitness_metrics.dart';

class FetchFitnessData {
  Future<FitnessData> call() async {
    // Simulate fetching fitness data
    await Future.delayed(Duration(seconds: 2));
    return FitnessData(
      steps: 8000,
      caloriesBurned: 500,
      workoutTime: 45,
    );
  }
}
