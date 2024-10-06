// lib/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'main_screen.dart'; // Import the main screen
import '/widgets/primary_button.dart';
import '/widgets/header_text.dart';
import '/widgets/custom_textfield.dart';
import '/widgets/reusable_panel.dart';
import '/widgets/reusable_bg.dart';
import '/widgets/auth_appbar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(),
      body: ReusableBG(
        content: ReusablePanel(
          title: 'login',
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderText("Register"),
              SizedBox(height: 40),
              StylizedTextField(labelText: 'Email'),
              SizedBox(height: 20),
              StylizedTextField(labelText: 'Password', isPassword: true),
              SizedBox(height: 20),
              StylizedTextField(labelText: 'Confirm', isPassword: true),
              SizedBox(height: 20),
              PrimaryButton(
                label: 'Register',
                onPressed: () {
                  // Navigate to MainScreen on successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                // backgroundColor: Colors.blue,
                // textColor: Colors.white,
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    // MaterialPageRoute(builder: (context) => LoginScreen())
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          LoginScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(-1.0, 0.0); // Start from right
                        const end = Offset.zero; // End at the center
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
