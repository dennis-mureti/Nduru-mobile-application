import 'dart:convert';

import 'package:http/http.dart' as http;

class ContactModel {
  String id;
  String token;
  int? statusCode;
  Map? contacts;

  ContactModel({required this.id, required this.token});
  Future<void> getData() async {
    var url = Uri.parse('http://10.0.2.2:5000/api/contacts/all/$id');
    var response = await http.get(
      url,
      headers: {
        "Accept": "/",
        "Content-Type": "application/x-www-form-urlencoded",
        "access_token": token
      },
    );

    statusCode = response.statusCode;
    contacts = jsonDecode(response.body);
    print(statusCode);
  }
}