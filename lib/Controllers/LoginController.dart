import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:VitalityTracker/views/HomeScreen.dart';

class LoginController {
  void signIn(BuildContext context, String username, String password) async {
    if (username.isEmpty || password.isEmpty) { // Check if both fields are filled
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Bitte Benutzername und Passwort eingeben!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    final response = await http.post(
      //'AZURE',
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) { //If Login is succesful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), //Redirect to Homescreen
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Falscher Benutzername oder Passwort!'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
