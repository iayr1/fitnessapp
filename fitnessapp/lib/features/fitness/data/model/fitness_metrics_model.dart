class FitnessModel {
  final int steps;
  final double caloriesBurned;
  final int workoutMinutes;
  final int heartRate;
  final double distance;
  final DateTime date;

  FitnessModel({
    required this.steps,
    required this.caloriesBurned,
    required this.workoutMinutes,
    required this.heartRate,
    required this.distance,
    required this.date,
  });

  factory FitnessModel.fromJson(Map<String, dynamic> json) {
    return FitnessModel(
      steps: json['steps'],
      caloriesBurned: json['caloriesBurned'].toDouble(),
      workoutMinutes: json['workoutMinutes'],
      heartRate: json['heartRate'],
      distance: json['distance'].toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  // Method to convert FitnessModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'steps': steps,
      'caloriesBurned': caloriesBurned,
      'workoutMinutes': workoutMinutes,
      'heartRate': heartRate,
      'distance': distance,
      'date': date.toIso8601String(),
    };
  }
}
