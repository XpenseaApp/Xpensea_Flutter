import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://your_api_base_url_here';

  // Send OTP
  Future<Map<String, dynamic>> sendOtp(String mobile) async {
    final response = await http.post(
      Uri.parse('$baseUrl/send-otp'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"mobile": mobile}),
    );
    return _handleResponse(response);
  }

  // Verify User
  Future<Map<String, dynamic>> verifyUser(String mobile, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/verify'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"mobile": mobile, "otp": otp}),
    );
    return _handleResponse(response);
  }

  // MPIN Handler
  Future<Map<String, dynamic>> mpinHandler(String mobile, String mpin) async {
    final response = await http.post(
      Uri.parse('$baseUrl/mpin'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"mobile": mobile, "mpin": mpin}),
    );
    return _handleResponse(response);
  }

  // Create Expense
  Future<Map<String, dynamic>> createExpense(
      Map<String, dynamic> expenseData, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/expense'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(expenseData),
    );
    return _handleResponse(response);
  }

  // Create Report
  Future<Map<String, dynamic>> createReport(
      Map<String, dynamic> reportData, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/report'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(reportData),
    );
    return _handleResponse(response);
  }

  // List Controller
  Future<Map<String, dynamic>> listController(
      String type, int pageNo, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/list?type=$type&pageNo=$pageNo'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return _handleResponse(response);
  }

  // Get Expense
  Future<Map<String, dynamic>> getExpense(String id, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/expense/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return _handleResponse(response);
  }

  // Get Report
  Future<Map<String, dynamic>> getReport(String id, String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/report/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return _handleResponse(response);
  }

  // Get Category
  Future<Map<String, dynamic>> getCategory(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/category'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return _handleResponse(response);
  }

  // Change MPIN
  Future<Map<String, dynamic>> changeMpin(
      String mobile, String mpin, String otp, String token) async {
    final response = await http.put(
      Uri.parse('$baseUrl/change-mpin'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode({"mobile": mobile, "mpin": mpin, "otp": otp}),
    );
    return _handleResponse(response);
  }

  // Report Problem
  Future<Map<String, dynamic>> reportProblem(
      Map<String, dynamic> problemData, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/report-problem'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(problemData),
    );
    return _handleResponse(response);
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
}
