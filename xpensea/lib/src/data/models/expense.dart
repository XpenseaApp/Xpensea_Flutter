import 'package:flutter_riverpod/flutter_riverpod.dart';

class Expense {
  final String title;
  final double amount;
  final String date;
  final String time;
  final String location;
  final String address;
  final String category;
  final String description;
  final String image;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.time,
    required this.location,
    required this.address,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      title: json['title'],
      amount: json['amount'],
      date: json['date'],
      time: json['time'],
      location: json['location'],
      address: json['address'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
      'date': date,
      'time': time,
      'location': location,
      'address': address,
      'category': category,
      'description': description,
      'image': image,
    };
  }

  Expense copyWith({
    String? title,
    double? amount,
    String? date,
    String? time,
    String? location,
    String? address,
    String? category,
    String? description,
    String? image,
  }) {
    return Expense(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      address: address ?? this.address,
      category: category ?? this.category,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}

class ExpenseNotifier extends StateNotifier<Expense> {
  ExpenseNotifier()
      : super(Expense(
          title: '',
          amount: 0.0,
          date: '',
          time: '',
          location: '',
          address: '',
          category: '',
          description: '',
          image: '',
        ));

  void addExpense(Expense expense) {
    state = Expense(
      title: expense.title,
      amount: expense.amount,
      date: expense.date,
      time: expense.time,
      location: expense.location,
      address: expense.address,
      category: expense.category,
      description: expense.description,
      image: expense.image,
    );
  }

  void removeExpense() {
    state = Expense(
      title: '',
      amount: 0.0,
      date: '',
      time: '',
      location: '',
      address: '',
      category: '',
      description: '',
      image: '',
    );
  }

  void updateExpenseTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateExpenseAmount(double amount) {
    state = state.copyWith(amount: amount);
  }

  void updateExpenseDate(String date) {
    state = state.copyWith(date: date);
  }

  void updateExpenseTime(String time) {
    state = state.copyWith(time: time);
  }

  void updateExpenseLocation(String location) {
    state = state.copyWith(location: location);
  }

  void updateExpenseAddress(String address) {
    state = state.copyWith(address: address);
  }

  void updateExpenseCategory(String category) {
    state = state.copyWith(category: category);
  }

  void updateExpenseDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updateExpenseImage(String image) {
    state = state.copyWith(image: image);
  }
}

final expenseProvider = StateNotifierProvider<ExpenseNotifier, Expense>((ref) {
  return ExpenseNotifier();
});
