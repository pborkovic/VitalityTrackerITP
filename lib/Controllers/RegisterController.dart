import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  Future<void> createAccount(
      BuildContext context,
      String firstName,
      String lastName,
      DateTime dob,
      String gender,
      String email,
      String password) async {
    if (firstName.isEmpty || lastName.isEmpty || dob == null || gender.isEmpty || email.isEmpty || password.isEmpty) {
      _showErrorMessage(context, 'Please fill all fields');
      return;
    }

    if (firstName.length > 255 || lastName.length > 255 || email.length > 255 || password.length > 255) {
      _showErrorMessage(context, 'Some fields exceed the max length');
      return;
    }

    final url = 'azure_API';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'FirstName': firstName,
        'LastName': lastName,
        'DateOfBirth': dob.toIso8601String(),
        'Gender': gender,
        'Email': email,
        'Password': password,
      },
    );

    if (response.statusCode == 200) {
      _showSuccessMessage(context, 'Account created successfully');
      Navigator.pushReplacementNamed(context, '/Milestones');
    } else {
      _showErrorMessage(
          context, 'Failed to create account. Please try again later.');
    }
  }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
