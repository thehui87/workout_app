// lib/screens/notification_slide_panel.dart
import 'package:flutter/material.dart';

class NotificationSlidePanel extends StatefulWidget {
  final Function onClose;

  const NotificationSlidePanel({super.key, required this.onClose});

  @override
  NotificationSlidePanelState createState() => NotificationSlidePanelState();
}

class NotificationSlidePanelState extends State<NotificationSlidePanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<double> _animation;

  final double _panelWidth = 300; // Width of the panel

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // _animation = Tween<double>(begin: -300, end: 0).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.easeInOut,
    // ))
    //   ..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       // Notify that the panel is fully open
    //     }
    //   });

    _controller.forward(); // Start the animation when the panel is opened
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomAppBarHeight =
        64.0; // kBottomNavigationBarHeight ... Get the height of the BottomNavigationBar
    final panelHeight =
        screenHeight - bottomAppBarHeight * 2; // Calculate available height

    return Positioned(
      right: 0,
      top: 0,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0), // Start off-screen
          end: Offset.zero, // End at the screen position
        ).animate(_controller),
        child: Container(
          width: _panelWidth,
          height: panelHeight, // Use the calculated height
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Notifications',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _controller.reverse(); // Slide out
                        Future.delayed(Duration(milliseconds: 300), () {
                          widget.onClose(); // Close the panel after animation
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Workout Reminder'),
                      subtitle:
                          Text('Don\'t forget your workout today at 6 PM!'),
                    ),
                    ListTile(
                      title: Text('New Feature Alert'),
                      subtitle: Text('Check out the new features in the app!'),
                    ),
                    ListTile(
                      title: Text('Workout Reminder'),
                      subtitle:
                          Text('Don\'t forget your workout today at 6 PM!'),
                    ),
                    ListTile(
                      title: Text('New Feature Alert'),
                      subtitle: Text('Check out the new features in the app!'),
                    ),
                    ListTile(
                      title: Text('Workout Reminder'),
                      subtitle:
                          Text('Don\'t forget your workout today at 6 PM!'),
                    ),
                    ListTile(
                      title: Text('New Feature Alert'),
                      subtitle: Text('Check out the new features in the app!'),
                    ),
                    ListTile(
                      title: Text('Workout Reminder'),
                      subtitle:
                          Text('Don\'t forget your workout today at 6 PM!'),
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
        ),
      ),
    );
  }
}
