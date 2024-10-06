import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';
// import 'notification_screen.dart';
// import 'notification_bottom_sheet.dart'; // Add this import at the top
// import 'notification_slide_panel.dart'; // Import the sliding panel

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedIndex = 0;
  // bool _isNotificationSelected = false;

  // List of titles corresponding to the screens
  final List<String> _titles = [
    'Login',
    'Register',
    'Forgot password',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedScreen;
    switch (_selectedIndex) {
      case 0:
        selectedScreen = LoginScreen();
        break;
      case 1:
        selectedScreen = RegisterScreen();
        break;
      case 2:
        selectedScreen = ForgotPasswordScreen();
        break;
      // case 3:
      //   selectedScreen = CalendarScreen();
      //   break;
      default:
        selectedScreen = LoginScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
        ), // Update title based on selected index
      ),
      body: selectedScreen,
      bottomNavigationBar: BottomAppBar(
        height: 10.0,
        child: Center(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          child: Text("Version 1.0"),
          // _buildNavItem(Icons.fitness_center, 3),
        ),
      ),
    );
  }
}
