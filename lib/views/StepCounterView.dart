import 'package:flutter/material.dart';
import 'package:VitalityTracker/Controllers/StepCounterController.dart';

class StepCounterView extends StatelessWidget {
  final StepCounterController controller;

  StepCounterView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StepCounter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Gemachte Schritte',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                controller.steps,
                style: TextStyle(fontSize: 60),
              ),
              Divider(
                height: 100,
                thickness: 0,
                color: Colors.white,
              ),
              Text(
                'Status',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                controller.status == 'Gehen'
                    ? Icons.directions_walk
                    : controller.status == 'Gestoppt'
                    ? Icons.accessibility_new
                    : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  controller.status,
                  style: controller.status == 'Gehen' ||
                      controller.status == 'Gestoppt'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
