import 'dart:convert';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpensea/src/data/models/report.dart';
import 'package:xpensea/src/data/routes/user_api_routes.dart';
import 'package:xpensea/src/data/models/event.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:http/http.dart' as http;

part 'user_helper.g.dart';

const String baseUrl = 'https://dev-api.xpensea.com/api/v1/user';

class Helper {
  final ApiService _apiService = ApiService();

  // Send OTP
  Future<Map<String, dynamic>> sendOtp(String mobile) async {
    try {
      return await _apiService.sendOtp(mobile);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // Verify User
  Future<Map<String, dynamic>> verifyUser(String mobile, String otp) async {
    try {
      return await _apiService.verifyUser(mobile, otp);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // MPIN Handler
  Future<Map<String, dynamic>> mpinHandler(String mobile, String mpin) async {
    try {
      final result = await _apiService.mpinHandler(mobile, mpin);
      if (result == null) {
        return {"success": false, "message": "Error: Received null response"};
      }
      return result;
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // Create Expense
  // Future<Map<String, dynamic>> createExpense(
  //     Map<String, dynamic> expenseData, String token) async {
  //   try {
  //     return await _apiService.createExpense(expenseData, token);
  //   } catch (e) {
  //     return {"success": false, "message": e.toString()};
  //   }
  // }

  // Create Report
  Future<Map<String, dynamic>> createReport(
      Map<String, dynamic> reportData, String token) async {
    try {
      return await _apiService.createReport(reportData, token);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> createEvent(
      Map<String, dynamic> eventData, String token) async {
    try {
      return await _apiService.createEvent(eventData, token);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // List Controller

  // Get Expense
  Future<Map<String, dynamic>> getExpense(String id, String token) async {
    try {
      return await _apiService.getExpense(id, token);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // Get Report
  Future<Map<String, dynamic>> getReport(String id, String token) async {
    try {
      return await _apiService.getReport(id, token);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // Get Category
  Future<List<dynamic>> getCategory(String token) async {
    try {
      final response = await _apiService.getCategory(token);
      if (response['success']) {
        return response['data'] as List<dynamic>;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Change MPIN
  Future<Map<String, dynamic>> changeMpin(
      String mobile, String mpin, String otp, String token) async {
    try {
      return await _apiService.changeMpin(mobile, mpin, otp, token);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // Report Problem
  Future<Map<String, dynamic>> reportProblem(
      Map<String, dynamic> problemData, String token) async {
    try {
      return await _apiService.reportProblem(problemData, token);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
}

@riverpod
Future<List<Expenses>> expenseList(
    ExpenseListRef ref, String token, String type) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/list?type=expenses'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> rawData = responseBody['data'];
      List<Expenses> data = rawData
          .where((e) => e['status'] == type)
          .map<Expenses>((e) => Expenses.fromJson(e))
          .toList();
      return data;
    } else {
      throw Exception(responseBody['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<List<Reports>> reportList(
    ReportListRef ref, String token, String type) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/list?type=reports'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> rawData = responseBody['data'];
      List<Reports> data = rawData
          .where((e) => e['status'] == type)
          .map<Reports>((e) => Reports.fromJson(e))
          .toList();
      return data;
    } else {
      throw Exception(responseBody['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<List<Reports>> approversList(
    ApproversListRef ref, String token, String type) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/list?type=approvals'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> rawData = responseBody['data'];
      List<Reports> data = rawData.where((e) {
        return e['status'] == type;
      }).map<Reports>((e) {
        return Reports.fromJson(e);
      }).toList();
      return data;
    } else {
      throw Exception(responseBody['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<List<Event>> eventList(
    EventListRef ref, String token, String type) async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/list?type=events'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });

    final responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<dynamic> rawData = responseBody['data'];
      List<Event> data = rawData
          .where((e) => e['status'] == type)
          .map<Event>((e) => Event.fromJson(e))
          .toList();
      return data;
    } else {
      throw Exception(responseBody['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<List<dynamic>> listController(
    ListControllerRef ref, String type, int pageNo, String token) async {
  try {
    final responsette = await http.get(
      Uri.parse('$baseUrl/list?type=$type'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    final response = _handleResponse(responsette);
    if (response['data']['status'] == 200) {
      print("response :${response['data']}");
      switch (type) {
        case 'expenses':
          List<Expenses> data = response['data']['data']
              .map<Expenses>((e) => Expenses.fromJson(e))
              .toList();
          return data;
        case 'report':
          return response['data'] as List<Reports>;
        case 'event':
          return response['data'] as List<Event>;
        default:
          return [];
      }
    } else {
      throw Exception(response['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

// Handle response
Map<String, dynamic> _handleResponse(http.Response response) {
  final Map<String, dynamic> responseBody = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return {"success": true, "data": responseBody};
  } else {
    return {
      "success": false,
      "message": responseBody['message'] ?? 'Unknown error'
    };
  }
}
