import 'package:flutter/material.dart';
import 'package:xpensea/src/data/routes/user_routes.dart';

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
      return await _apiService.mpinHandler(mobile, mpin);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // Create Expense
  Future<Map<String, dynamic>> createExpense(
      Map<String, dynamic> expenseData, String token) async {
    try {
      return await _apiService.createExpense(expenseData, token);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // Create Report
  Future<Map<String, dynamic>> createReport(
      Map<String, dynamic> reportData, String token) async {
    try {
      return await _apiService.createReport(reportData, token);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // List Controller
  Future<List<dynamic>> listController(
      String type, int pageNo, String token) async {
    try {
      final response = await _apiService.listController(type, pageNo, token);
      if (response['success']) {
        return response['data'] as List<dynamic>;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

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
