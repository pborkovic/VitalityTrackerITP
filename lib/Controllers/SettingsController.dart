import 'package:flutter/material.dart';
import 'package:VitalityTracker/models/DarkModeModel.dart';
import 'package:VitalityTracker/views/HomeScreen.dart';

class SettingsController {
  final DarkModeModel darkModeModel;

  SettingsController({required this.darkModeModel, required DarkModeModel});

  void toggleDarkMode() {
    darkModeModel.toggleDarkMode();
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}
