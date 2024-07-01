class Event {
  String eventName;
  String startDate;
  String endDate;
  String startTime;
  String endTime;
  String description;
  String location;
  String status;

  Event({
    required this.eventName,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.location,
    required this.status,
  });
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventName: json['eventName'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      description: json['description'],
      location: json['location'],
      status: json['status'],
    );
  }
}
