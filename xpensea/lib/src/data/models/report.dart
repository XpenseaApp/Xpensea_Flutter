import 'package:flutter_riverpod/flutter_riverpod.dart';

class Report {
  final String title;
  final String reportDate;
  final String description;
  final String location;
  final String type;
  final String event;
  final String status;
  final List<String> expenses;

  Report({
    required this.title,
    required this.reportDate,
    required this.description,
    required this.location,
    required this.type,
    required this.event,
    required this.status,
    required this.expenses,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      title: json['title'],
      reportDate: json['reportDate'],
      description: json['description'],
      location: json['location'],
      type: json['type'],
      event: json['event'],
      status: json['status'],
      expenses: List<String>.from(json['expenses']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'reportDate': reportDate,
      'description': description,
      'location': location,
      'type': type,
      'event': event,
      'status': status,
      'expenses': expenses,
    };
  }

  Report copyWith({
    String? title,
    String? reportDate,
    String? description,
    String? location,
    String? type,
    String? event,
    String? status,
    List<String>? expenses,
  }) {
    return Report(
      title: title ?? this.title,
      reportDate: reportDate ?? this.reportDate,
      description: description ?? this.description,
      location: location ?? this.location,
      type: type ?? this.type,
      event: event ?? this.event,
      status: status ?? this.status,
      expenses: expenses ?? this.expenses,
    );
  }
}

class ReportNotifier extends StateNotifier<Report> {
  ReportNotifier()
      : super(Report(
          title: '',
          reportDate: '',
          description: '',
          location: '',
          type: '',
          event: '',
          status: '',
          expenses: [],
        ));

  void addReport(Report report) {
    state = Report(
      title: report.title,
      reportDate: report.reportDate,
      description: report.description,
      location: report.location,
      type: report.type,
      event: report.event,
      status: report.status,
      expenses: report.expenses,
    );
  }

  void removeReport() {
    state = Report(
      title: '',
      reportDate: '',
      description: '',
      location: '',
      type: '',
      event: '',
      status: '',
      expenses: [],
    );
  }

  void updateReportTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateReportReportDate(String reportDate) {
    state = state.copyWith(reportDate: reportDate);
  }

  void updateReportDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updateReportLocation(String location) {
    state = state.copyWith(location: location);
  }

  void updateReportType(String type) {
    state = state.copyWith(type: type);
  }

  void updateReportEvent(String event) {
    state = state.copyWith(event: event);
  }

  void updateReportStatus(String status) {
    state = state.copyWith(status: status);
  }

  void updateReportExpenses(String expenses) {
    if (!state.expenses.contains(expenses)) {
      state = state.copyWith(expenses: [...state.expenses, expenses]);
    }
  }
}

final reportProvider = StateNotifierProvider<ReportNotifier, Report>((ref) {
  return ReportNotifier();
});
