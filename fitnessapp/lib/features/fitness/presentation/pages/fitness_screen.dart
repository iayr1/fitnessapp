import 'package:fitnessapp/features/fitness/domain/entities/fitness_metrics.dart';
import 'package:fitnessapp/features/fitness/domain/repository/fitbit_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/fitness_cubit.dart';
import '../widgets/activity_card.dart';
import '../widgets/steps_tracker.dart';

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Fitness Progress"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => FitnessCubit(FetchFitnessData)..loadFitnessData(),
        child: BlocBuilder<FitnessCubit, FitnessState>(
          builder: (context, state) {
            if (state is FitnessLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FitnessLoaded) {
              return _buildFitnessContent(state.fitnessData);
            } else if (state is FitnessError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Load fitness data'));
          },
        ),
      ),
    );
  }

  Widget _buildFitnessContent(FitnessData fitnessData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StepsTracker(steps: fitnessData.steps),
          const SizedBox(height: 20),
          ActivityCard(
            icon: Icons.local_fire_department,
            label: 'Calories Burned',
            value: '${fitnessData.caloriesBurned} kcal',
          ),
          const SizedBox(height: 20),
          ActivityCard(
            icon: Icons.timer,
            label: 'Workout Time',
            value: '${fitnessData.workoutTime} min',
          ),
        ],
      ),
    );
  }
}
