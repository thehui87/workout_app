// lib/screens/notification_bottom_sheet.dart
import 'package:flutter/material.dart';

class NotificationBottomSheet extends StatelessWidget {
  const NotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 400, // Set the height of the bottom sheet
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Notifications',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
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
          ),
        ],
      ),
    );
  }
}
