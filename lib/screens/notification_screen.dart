// lib/screens/notification_screen.dart
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Workout Reminder'),
            subtitle: Text('Don\'t forget your workout today at 6 PM!'),
          ),
          ListTile(
            title: Text('New Feature Alert'),
            subtitle: Text('Check out the new features in the app!'),
          ),
          // Add more notifications as needed
        ],
      ),
    );
  }
}



// class NotificationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: Center( // Center the container in the middle of the screen
//         child: Container(
//           width: 400, // Set a fixed width or use MediaQuery for responsiveness
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Your Notifications',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     ListTile(
//                       title: Text('Workout Reminder'),
//                       subtitle: Text('Don\'t forget your workout today at 6 PM!'),
//                     ),
//                     ListTile(
//                       title: Text('New Feature Alert'),
//                       subtitle: Text('Check out the new features in the app!'),
//                     ),
//                     // Add more notifications as needed
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
