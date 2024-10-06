// lib/screens/forgot_password_screen.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';
import '/widgets/primary_button.dart';
import '/widgets/header_text.dart';
import '/widgets/custom_textfield.dart';
import '/widgets/reusable_panel.dart';
import '/widgets/reusable_bg.dart';
import '/widgets/auth_appbar.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              HeaderText("Forgot Password"),
              SizedBox(height: 40),
              StylizedTextField(labelText: 'Email'),
              SizedBox(height: 20),
              PrimaryButton(
                label: 'Submit',
                onPressed: () {
                  // Navigate to MainScreen on successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                // backgroundColor: Colors.blue,
                // textColor: Colors.white,
              ),
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
