import 'package:flutter/material.dart';
import 'package:sample_flutter_app/signup.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
            Image.asset(
              'assets/welcome.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            // Title
            Text(
              'Welcome to Your App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Description
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Nunc hendrerit mi id risus condimentum, at faucibus justo porttitor.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            // Get Started Button
            ElevatedButton(
              onPressed: () {
                // Add any navigation logic here to move to the next screen
                // For example:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text('Get Started'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
