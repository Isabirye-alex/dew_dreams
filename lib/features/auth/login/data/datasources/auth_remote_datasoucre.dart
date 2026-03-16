import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthRemoteDataSource {
  final String baseUrl;

  AuthRemoteDataSource(this.baseUrl);

  Future<UserModel> login(String userName, String password) async {
    // final String resp;
    final response = await http.post(
      Uri.parse('$baseUrl/login/'),
      body: jsonEncode({"username": userName, "password": password}),
      headers: {"Content-Type": "application/json"},
    );
    debugPrint('${response.body}');
    if (response.statusCode == 200) {
      debugPrint('Verfiying');
      final result = jsonDecode(response.body);

      final status = result['status'];
      if (status == 'success') {
        final userID = result['userId'];

        final response2 = await http.get(
          (Uri.parse('$baseUrl/info?userId=$userID')),
        );
        debugPrint(response2.body);
        return UserModel.fromJson(jsonDecode(response2.body));
      }
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Login failed");
    }
  }
}
