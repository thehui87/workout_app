// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'register_screen.dart'; // Import the register screen
import 'forgot_password_screen.dart'; // Import the forgot password screen
import 'main_screen.dart'; // Import the main screen
import '/widgets/primary_button.dart'; // Import the custom button widget
import '/widgets/header_text.dart';
import '/widgets/custom_textfield.dart';
import '/widgets/reusable_panel.dart';
import '/widgets/reusable_bg.dart';
import '/widgets/auth_appbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppBar(),
      body: ReusableBG(
        content: Container(
          color: Colors.transparent,
          child: ReusablePanel(
            title: 'login',
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeaderText("Login"),
                SizedBox(height: 40),
                StylizedTextField(labelText: "Email"),
                SizedBox(height: 20),
                StylizedTextField(labelText: "Password", isPassword: true),
                SizedBox(height: 20),
                PrimaryButton(
                  label: 'Login',
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
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text('Register'),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
