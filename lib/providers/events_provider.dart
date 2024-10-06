// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart'; // Import intl package
// import 'package:table_calendar/table_calendar.dart';

// Event Model
class Event {
  final String title;
  final DateTime date;

  Event({required this.title, required this.date});
}

// Event Provider
final eventsProvider =
    StateNotifierProvider<EventNotifier, Map<DateTime, List<Event>>>((ref) {
  return EventNotifier();
});

class EventNotifier extends StateNotifier<Map<DateTime, List<Event>>> {
  EventNotifier() : super({});

  void addEvent(DateTime date, String title) {
    final event = Event(title: title, date: date);
    state = {
      ...state,
      date: [...(state[date] ?? []), event],
    };
    print('Added event: $title on ${date.toLocal()}');
  }
}
