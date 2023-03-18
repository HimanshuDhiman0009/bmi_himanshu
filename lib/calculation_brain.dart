import 'dart:math';

class CalculationBrain {
  CalculationBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  double? bmi;
  String? calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi?.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi! >= 25) {
      return 'overweight';
    } else if (bmi! > 18.5) {
      return 'normal';
    } else {
      return 'under weight';
    }
  }

  String getInterpretation() {
    if (bmi! >= 25) {
      return 'You are overweight,'
          'Try to do exercise daily';
    } else if (bmi! > 18.5) {
      return 'your BMI is normal ,'
          'Just keep it up';
    } else {
      return 'You are underweight,' //
          'Try to get surplus calories';
    }
  }
}
