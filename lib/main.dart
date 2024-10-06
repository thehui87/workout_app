import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/colors.dart';
// import 'theme/app_theme.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      // theme: AppTheme.lightTheme,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme(
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor,
          surface: AppColors.surfaceColor,
          error: AppColors.errorColor,
          onPrimary: AppColors.onPrimary,
          onSecondary: AppColors.onSecondary,
          onSurface: AppColors.onBackground,
          onError: AppColors.onError,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.onBackground),
          bodyMedium: TextStyle(color: AppColors.onBackground),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.primaryVariant,
          selectedItemColor: AppColors.onPrimary,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.transparent, // Set to transparent
        body: Stack(children: [
          // Load SVG as a background

          Center(
            child: LoginScreen(),
            // child: Text(
            //   'Welcome to My App!',
            //   style: TextStyle(
            //     fontSize: 32,
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ),
        ]),
      ),
    );
  }
}
