import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'screens/home_screen.dart';
import 'screens/login.dart';
import 'screens/signup_screen.dart';
import 'widget/navigation_drawer_widget.dart';
import 'models/authentication.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Nduru Application';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
          )
      ],
          child: MaterialApp(
        // title: 'Nduru App',
        title: title,
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: LoginScreen(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
    );
  }
}