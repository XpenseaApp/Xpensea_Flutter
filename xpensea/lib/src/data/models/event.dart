import 'package:flutter_riverpod/flutter_riverpod.dart';

class Event {
  final String? id;
  final String eventName;
  final int? days;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final String description;
  final String? location;
  final String status;

  Event({
    required this.id,
    required this.eventName,
    this.days,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.description,
    this.location,
    required this.status,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      eventName: json['eventName'],
      days: json['days'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      description: json['description'],
      location: json['location'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventName': eventName,
      'days': days,
      'startDate': startDate,
      'endDate': endDate,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
      if (location != '') 'location': location,
      if (status != '') 'status': status,
    };
  }

  Event copyWith({
    String? eventName,
    int? days,
    String? startDate,
    String? endDate,
    String? startTime,
    String? endTime,
    String? description,
    String? location,
    String? status,
  }) {
    return Event(
      id: id,
      eventName: eventName ?? this.eventName,
      days: days ?? this.days,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      description: description ?? this.description,
      location: location ?? this.location,
      status: status ?? this.status,
    );
  }
}

class EventNotifier extends StateNotifier<Event> {
  EventNotifier()
      : super(Event(
          id: '',
          eventName: '',
          days: 0,
          startDate: '',
          endDate: '',
          startTime: '',
          endTime: '',
          description: '',
          location: '',
          status: '',
        ));

  void addEvent(Event event) {
    state = Event(
      id: event.id,
      eventName: event.eventName,
      days: event.days,
      startDate: event.startDate,
      endDate: event.endDate,
      startTime: event.startTime,
      endTime: event.endTime,
      description: event.description,
      location: event.location,
      status: event.status,
    );
  }

  void removeEvent() {
    state = Event(
      id: '',
      eventName: '',
      days: 0,
      startDate: '',
      endDate: '',
      startTime: '',
      endTime: '',
      description: '',
      location: '',
      status: '',
    );
  }

  void updateEventName(String eventName) {
    state = state.copyWith(eventName: eventName);
  }

  void updateEventDays(int days) {
    state = state.copyWith(days: days);
  }

  void updateEventStartDate(String startDate) {
    state = state.copyWith(startDate: startDate);
  }

  void updateEventEndDate(String endDate) {
    state = state.copyWith(endDate: endDate);
  }

  void updateEventStartTime(String startTime) {
    state = state.copyWith(startTime: startTime);
  }

  void updateEventEndTime(String endTime) {
    state = state.copyWith(endTime: endTime);
  }

  void updateEventDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updateEventLocation(String location) {
    state = state.copyWith(location: location);
  }

  void updateEventStatus(String status) {
    state = state.copyWith(status: status);
  }
}

final eventProvider = StateNotifierProvider<EventNotifier, Event>((ref) {
  return EventNotifier();
});
