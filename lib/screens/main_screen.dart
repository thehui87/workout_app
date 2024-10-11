import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'home_screen.dart';
import 'dashboard_screen.dart';
import 'feed_screen.dart';
import 'calendar_screen.dart';
import 'profile_screen.dart';
import 'more_screen.dart';
import 'planner_screen.dart';
// import 'notification_screen.dart';
// import 'notification_bottom_sheet.dart'; // Add this import at the top
import 'notification_slide_panel.dart'; // Import the sliding panel
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _selectedIndex = 0;
  bool _isPanelVisible = false;
  // bool _isNotificationSelected = false;

  // List of titles corresponding to the screens
  final List<String> _titles = [
    'Dashboard',
    'Planner',
    'Feed',
    'Calendar',
    'More'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// Method to show the notification panel
  void _showNotificationPanel() {
    setState(() {
      _isPanelVisible = true; // Show the panel
    });
  }

  // Method to close the notification panel
  void _closeNotificationPanel() {
    setState(() {
      _isPanelVisible = false; // Hide the panel
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedScreen;
    switch (_selectedIndex) {
      // case 0:
      //   selectedScreen = HomeScreen();
      //   break;
      case 0:
        selectedScreen = DashboardScreen();
        break;
      case 1:
        selectedScreen = PlannerScreen();
        break;
      case 2:
        selectedScreen = FeedScreen();
        break;
      case 3:
        selectedScreen = CalendarScreen();
        break;
      case 4:
        selectedScreen = MoreScreen();
        break;
      default:
        selectedScreen = DashboardScreen();
    }

    // return Scaffold(
    //   body: selectedScreen,
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.dashboard), label: 'Dashboard'),
    //       BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Feed'),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.calendar_today), label: 'Calendar'),
    //     ],
    //     currentIndex: _selectedIndex,
    //     onTap: _onItemTapped,
    //     type: BottomNavigationBarType.fixed,
    //     backgroundColor: Colors.blueAccent, // Change background color here
    //     selectedItemColor: Colors.white, // Change selected item color here
    //     unselectedItemColor: Colors.grey, // Change unselected item color here
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
        ), // Update title based on selected index
        actions: [
          SizedBox(width: 20),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: _isPanelVisible
                  ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor, // Change color on selection
            ),
            onPressed: _showNotificationPanel,
            // onPressed: () {
            //   // Navigate to NotificationScreen
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (context) => NotificationScreen()),
            //   // );
            //   // Show the bottom sheet for notifications
            //   showModalBottomSheet(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return NotificationBottomSheet();
            //     },
            //   );
            // },
          ),
          SizedBox(width: 20),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to ProfileScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          selectedScreen,
          if (_isPanelVisible)
            NotificationSlidePanel(
              onClose: _closeNotificationPanel,
            ), // Show the sliding panel
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // _buildNavItem(context, Icons.home, 0),
            _buildNavItem(
                context, 'assets/images/icons/Home_ico.svg', 0), // Icons.home
            _buildNavItem(context, 'assets/images/icons/Planner_ico.svg',
                1), // Icons.fitness_center
            _buildNavItem(
                context, 'assets/images/icons/Feed_ico.svg', 2), // Icons.list
            _buildNavItem(context, 'assets/images/icons/Calendar_ico.svg',
                3), // Icons.calendar_today
            _buildNavItem(context, 'assets/images/icons/More_ico.svg',
                4), // Icons.more_horiz
            // _buildNavItem(Icons.fitness_center, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String iconPath, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            // Icon(
            //   icon,
            //   color: _selectedIndex == index
            //       ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
            //       : Theme.of(context)
            //           .bottomNavigationBarTheme
            //           .unselectedItemColor,
            // ),
            SvgPicture.asset(iconPath,
                fit: BoxFit.cover,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                    (_selectedIndex == index
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor) ??
                        Colors.grey,
                    BlendMode.srcIn)),
            SizedBox(height: 5),
            Text(
              _titles[index], // Your text
              style: TextStyle(
                color: _selectedIndex == index
                    ? Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor
                    : Theme.of(context)
                        .bottomNavigationBarTheme
                        .unselectedItemColor,
                fontSize: 10,
              ), // Spacing between icon and text
            ),
          ],
        ),
      ),
    );
  }
}
