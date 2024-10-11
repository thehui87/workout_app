import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Home Screen',
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               // Handle settings button press
//             },
//           ),
//         ],
//       ),
//       body: Center(child: Text('Welcome to the Home Screen!')),
//     );
//   }
// }

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const AuthAppBar({super.key, this.title = 'Workout Planner', this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png', // Replace with your logo asset path
            height: 40, // Adjust height as needed
          ),
          SizedBox(width: 10), // Space between logo and title
          Center(
            // child: Container(
            child: Text(title),
            // ),
          ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
