// lib/screens/calendar_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/widgets/reusable_bg.dart';
import '/screens/day_view_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import '/providers/events_provider.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});
  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends ConsumerState<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    // Currently selected day
    DateTime selectedDay = DateTime.now();

    void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
      setState(() {
        selectedDay = selectedDay;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DayViewScreen(selectedDay: selectedDay)),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Calendar Example'),
      // ),
      body: ReusableBG(
        content: Column(
          children: [
            Expanded(
              child: Column(
                //   height: MediaQuery.of(context).size.height - 70,
                children: [
                  TableCalendar(
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    focusedDay: selectedDay,
                    selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                    onDaySelected: onDaySelected,
                    eventLoader: (day) {
                      return ref.watch(eventsProvider)[day] ?? [];
                    },
                    calendarStyle: CalendarStyle(
                      // todayDecoration: BoxDecoration(
                      //   // color: Theme.of(context).colorScheme.secondary,
                      //   border: Border.all(color: Colors.white, width: 2),
                      //   shape: BoxShape.rectangle,
                      // ),
                      // selectedDecoration: BoxDecoration(
                      //   color: Theme.of(context).colorScheme.surface,
                      //   border: Border.all(
                      //       color: Theme.of(context).primaryColor, width: 2),
                      //   shape: BoxShape.rectangle,
                      // ),
                      // Style for days
                      // defaultDecoration: BoxDecoration(
                      //   color: Theme.of(context).colorScheme.surface,
                      //   border: Border.all(
                      //       color: Colors.grey
                      //           .withOpacity(0.5)), // Grid lines for days
                      //   shape: BoxShape.rectangle,
                      // ),
                      weekendDecoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        border: Border.all(
                            color: Colors.grey
                                .withOpacity(0.5)), // Grid lines for days
                        shape: BoxShape.rectangle,
                      ),
                      markerDecoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                      ),
                      defaultTextStyle: TextStyle(
                          color: Colors.white), // Text color for weekdays
                      weekendTextStyle: TextStyle(
                          color: Colors.white), // Text color for weekends
                      markersAlignment: Alignment.topRight,
                      cellMargin: EdgeInsets.all(4.0),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false, // Hide format button
                      titleCentered: true, // Center the title
                      titleTextStyle: TextStyle(fontSize: 20),
                      leftChevronIcon: Icon(Icons.chevron_left,
                          color: Colors.white), // Left arrow color
                      rightChevronIcon: Icon(Icons.chevron_right,
                          color: Colors.white), // Right arrow color
                      headerPadding:
                          EdgeInsets.symmetric(vertical: 10.0), // Add padding
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor, // Background color for days of the week
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle:
                          TextStyle(color: Colors.white), // Weekend text color
                      weekdayStyle:
                          TextStyle(color: Colors.white), // Weekday text color
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor, // Background color for days of the week
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, date, focusedDay) {
                        return Container(
                          alignment: Alignment
                              .topLeft, // Align the date to the top left
                          padding: EdgeInsets.all(2.0), // Add some padding
                          margin: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            '${date.day}', // Display the day number
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      // todayBuilder: (context, date, focusedDay) {
                      //   return Container(
                      //     alignment: Alignment
                      //         .topLeft, // Align the date to the top left
                      //     padding: EdgeInsets.all(8.0), // Add some padding
                      //     // color: Theme.of(context).scaffoldBackgroundColor,
                      //     decoration: BoxDecoration(
                      //       color: Theme.of(context).colorScheme.surface,
                      //       border: Border.all(
                      //           color: Theme.of(context).primaryColor,
                      //           width: 2), // Grid lines for days
                      //       shape: BoxShape.rectangle,
                      //     ),
                      //     child: Text(
                      //       '${date.day}', // Display the day number
                      //       style: TextStyle(fontSize: 16),
                      //     ),
                      //   );
                      // },
                      selectedBuilder: (context, date, focusedDay) {
                        return Container(
                          alignment: Alignment
                              .topLeft, // Align the date to the top left
                          padding: EdgeInsets.all(2.0), // Add some padding
                          // color: Theme.of(context).scaffoldBackgroundColor,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2), // Grid lines for days
                            shape: BoxShape.rectangle,
                          ),
                          child: Text(
                            '${date.day}', // Display the day number
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      },
                      markerBuilder: (context, date, events) {
                        if (events.isNotEmpty) {
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            child: Stack(children: [
                              // Column(
                              // mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              // children: events.map((event) {
                              //   return Column(children: [
                              // Container(
                              //   // padding: const EdgeInsets.only(bottom: 4.0),
                              //   decoration: BoxDecoration(
                              //     color: Colors.red,
                              //   ),
                              //   height: 5.0,
                              //   width: double.infinity,
                              //   child: Text(
                              //     events.length.toString(),
                              //     style: TextStyle(color: Colors.white),
                              //   ),
                              // ),
                              //     SizedBox(height: 6),
                              //   ]);
                              // }).toList(),
                              // children: [
                              Positioned(
                                bottom: 0, // Fix to the bottom
                                left: 0,
                                right: 0,
                                child: Container(
                                  // padding: const EdgeInsets.only(bottom: 4.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  height: 20.0,
                                  width: double.infinity,
                                  child: Text(
                                    events.length.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              // ],
                              // ),
                            ]),
                          );
                        }
                        return SizedBox.shrink(); // Return empty if no events
                      },
                    ),
                  ),
                  // SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
