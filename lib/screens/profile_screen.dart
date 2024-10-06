// lib/screens/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                'images/bg1test.png', // Correct path to your PNG
              ),
            ),
            //    NetworkImage(
            //       'https://via.placeholder.com/150'), // Replace with user image
            // ),
            SizedBox(height: 20),
            Text(
              'User Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('user@example.com'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle edit profile
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
