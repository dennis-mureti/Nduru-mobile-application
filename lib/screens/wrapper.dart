import 'package:flutter/material.dart';
import '../models/authentication.dart';
import 'package:nduru_mobile_aplication/screens/home_screen.dart';
import 'package:nduru_mobile_aplication/screens/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of(context);


    if(user == null) {
      return LoginScreen();

    } else {
      return HomeScreen();
    }
  }
}