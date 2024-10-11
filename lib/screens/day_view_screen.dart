// lib/screens/calendar_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/providers/events_provider.dart';
import '/widgets/custom_snackbar.dart';

// import '/widgets/reusable_bg.dart';
class DayViewScreen extends ConsumerStatefulWidget {
  final DateTime selectedDay;

  const DayViewScreen({super.key, required this.selectedDay});

  @override
  DayViewScreenState createState() => DayViewScreenState();
}

class DayViewScreenState extends ConsumerState<DayViewScreen> {
  late DateTime _currentDay;
  final TextEditingController _eventController = TextEditingController();
  // bool _showSnackBar = false;
  // String _snackBarMessage = '';

  // void _showCustomSnackBar(String message) {
  //   setState(() {
  //     _snackBarMessage = message;
  //     _showSnackBar = true;
  //   });

  //   // Automatically hide the Snackbar after a duration
  //   Future.delayed(Duration(seconds: 3), () {
  //     if (mounted) {
  //       // Check if the widget is still mounted
  //       setState(() {
  //         _showSnackBar = false;
  //       });
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _currentDay = widget.selectedDay;
  }

  void _goToPreviousDay() {
    setState(() {
      _currentDay = _currentDay.subtract(Duration(days: 1));
    });
  }

  void _goToNextDay() {
    setState(() {
      _currentDay = _currentDay.add(Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventsProvider)[_currentDay] ?? [];
    // Format the date
    String formattedDate = DateFormat('EEEE, d MMMM').format(_currentDay);

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Events'),
      ),
      body:
          // Stack(children: [
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: _goToPreviousDay,
              ),
              Text(
                formattedDate,
                style: TextStyle(fontSize: 24),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: _goToNextDay,
              ),
            ]),
            SizedBox(height: 20),
            TextField(
              controller: _eventController,
              decoration: InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle event addition logic here
                // Navigator.pop(context); // Go back to the calendar screen
                if (_eventController.text.isNotEmpty) {
                  ref
                      .read(eventsProvider.notifier)
                      .addEvent(_currentDay, _eventController.text);
                  _eventController.clear();
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text('Event Added!')),
                  // );
                  // _showCustomSnackBar('Event Added!');
                  showGlobalSnackbar(context, 'Event Added!');
                }
              },
              child: Text('Add Event'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(events[index].title),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
