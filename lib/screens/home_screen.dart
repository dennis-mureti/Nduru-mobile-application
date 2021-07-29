import 'package:flutter/material.dart';
import 'package:nduru_mobile_aplication/widget/navigation_drawer_widget.dart';
import '../models/authentication.dart';

class HomeScreen extends StatelessWidget {

  final Authentication _auth = Authentication();

  static const routeName = '/home';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Hello, :-) This Is your Nduru Home screen', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            
          ),
        ),

        
      ),
      
    );
  }
  
}
