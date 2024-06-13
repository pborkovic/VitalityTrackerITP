import 'dart:async';
import 'package:pedometer/pedometer.dart';

class StepCounterController {
  late Stream<StepCount> stepCountStream;
  late Stream<PedestrianStatus> pedestrianStatusStream;

  late String steps;
  late String status;

  StepCounterController() {
    steps = '?';
    status = '?';
    initStreams();
  }

  void initStreams() {
    pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    pedestrianStatusStream.listen((event) {
      onPedestrianStatusChanged(event);
    }).onError((error) {
      onPedestrianStatusError(error);
    });

    stepCountStream = Pedometer.stepCountStream;
    stepCountStream.listen((event) {
      onStepCount(event);
    }).onError((error) {
      onStepCountError(error);
    });
  }

  void onStepCount(StepCount event) {
    print(event);
    steps = event.steps.toString();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    status = event.status;
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    status = 'StepCounter nicht verfügbar';
    print(status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    steps = 'StepCounter nicht verfügbar';
  }
}
