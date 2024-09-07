import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/data/models/expense.dart';
import 'package:xpensea/src/data/models/report.dart';
import 'package:xpensea/src/data/repos/location.dart';
import 'package:xpensea/src/data/routes/user_api_routes.dart';
import 'package:xpensea/src/data/models/event.dart';
import 'package:xpensea/src/presentation/components/cards/expenses_card.dart';
import 'package:xpensea/src/presentation/components/cards/report_card.dart';
import 'package:http/http.dart' as http;

part 'user_helper.g.dart';

final String baseUrl =
    'https://xpensea--backend-393541516579.asia-south1.run.app/api/v1/user';
// const String baseUrl = 'https://192.168.29.144:3030/api/v1/user';

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

// Update Approval
Future<dynamic> UpdateApproval(String id, List<String> expenses, String action,
    String token, BuildContext context) async {
  try {
    final response = await http.put(
      Uri.parse('$baseUrl/approval/$id/$action'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode({"expenses": expenses}),
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppPalette.kPrimaryColor,
          content: Text(responseBody['message']),
        ),
      );
      return responseBody['data'];
    } else {
      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppPalette.kPrimaryColor,
          content: Text(responseBody['message']),
        ),
      );
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

// Update Report
Future<dynamic> UpdateReport(String id, List<String> expenses, String token,
    String type, BuildContext context) async {
  try {
    final response = await http.put(
      Uri.parse('$baseUrl/report/$id?type=$type'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode({"expenses": expenses, "status": type}),
    );

    final responseBody = jsonDecode(response.body);
    log('responseBody: ${responseBody}');
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppPalette.kPrimaryColor,
          content: Text(responseBody['message']),
        ),
      );
      return responseBody['data'];
    } else {
      // Show Snackbar
      log('responseBody: ${responseBody['message']}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppPalette.kPrimaryColor,
          content: Text(responseBody['message']),
        ),
      );
    }
  } catch (e) {
    throw Exception(e.toString());
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
      Timer(Duration(seconds: 2), () {
        ref.invalidateSelf();
      });
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
      log('rawData: ${rawData}');
      List<Event> data = rawData
          .where((e) => e['status'] == type)
          .map<Event>((e) => Event.fromJson(e))
          .toList();
      return data;
    } else {
      log(responseBody['message']);
      List<Event> data = [];
      return data;
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<Expenses> getExpense(GetExpenseRef ref, String id, String token) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/expense/${id}'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );

    final responseBody = jsonDecode(response.body);

    log('responseBody: ${responseBody}');
    if (response.statusCode == 200) {
      return Expenses.fromJson(responseBody['data']);
    } else {
      throw Exception(responseBody['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<dynamic> getReport(
    GetReportRef ref, String id, String? isEvent, String token) async {
  try {
    log('request: ${'$baseUrl/report/${id}${isEvent != null ? "?isEvent=$isEvent" : ""}'}');
    final response = await http.get(
      Uri.parse(
          '$baseUrl/report/${id}${isEvent != null ? "?isEvent=$isEvent" : ""}'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );

    final responseBody = jsonDecode(response.body);
    log('responseBody: ${responseBody}');

    log('responseData: ${responseBody['data']}');

    if (response.statusCode == 200) {
      return responseBody['data'];
    } else {
      throw Exception(responseBody['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<dynamic> getApproval(GetApprovalRef ref, String id, String token) async {
  // log('id: $id');
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/approval/${id}'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token}"
      },
    );

    final responseBody = jsonDecode(response.body);
    // log('responseBody: ${responseBody}');

    if (response.statusCode == 200) {
      return responseBody['data'];
    } else {
      throw Exception(responseBody['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<List<String>> getCatagories(GetCatagoriesRef ref, String token) async {
  final response = await http.get(
    Uri.parse('$baseUrl/category'),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    },
  );
  final responseBody = jsonDecode(response.body);
  List<String> categories = [];
  for (var category in responseBody['data']) {
    categories.add(category['title']);
  }
  return categories;
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

@riverpod
Future<Map<String, dynamic>> getWallet(GetWalletRef ref, String token) async {
  final response = await http.get(
    Uri.parse('$baseUrl/wallet'),
    headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    },
  );
  return _handleResponse(response);
}

@riverpod
Future<dynamic> getPolicy(GetPolicyRef ref, String token) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/policy'),
      headers: {"Authorization": "Bearer $token"},
    );

    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseBody['data'];
    } else {
      // Show Snackbar
      throw Exception(responseBody['message']);
    }
  } catch (e) {
    throw Exception(e.toString());
  }
}

@riverpod
Future<dynamic> saveLocation(SaveLocationRef ref, String eventName,
    String? eventId, String token) async {
  try {
    final location = await determinePosition();

    // Define the request body
    final requestBody = {
      "eventName": eventName,
      "location": "${location.latitude},${location.longitude}",
    };

    // Add eventId to the request body if it's provided
    if (eventId != null && eventId.isNotEmpty) {
      requestBody["eventId"] = eventId;
    }

    // Convert request body to JSON string
    final jsonBody = jsonEncode(requestBody);

    // Make the HTTP POST request to save the location
    final response = await http.post(
      Uri.parse(baseUrl + '/location'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonBody,
    );
    // Decode the response body
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // Show success message using SnackBar

      Timer(const Duration(minutes: 5), () {
        ref.invalidateSelf();
      });
      return responseBody;
    } else {
      // Show error message using SnackBar
      return _handleResponse(response);
    }
  } catch (e) {
    // Handle any exceptions that occur during the request
    log('error: ${e.toString()}');
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
