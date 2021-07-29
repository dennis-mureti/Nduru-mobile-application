import 'package:flutter/material.dart';
import 'package:nduru_mobile_aplication/widget/navigation_drawer_widget.dart';

class ProfileScreen extends StatelessWidget {
    static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Text(
          'This Is your Profile', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      
    );
  }
}