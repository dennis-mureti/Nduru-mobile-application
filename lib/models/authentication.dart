import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'http_exception.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class Authentication with ChangeNotifier
{

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // User? _userFromFirebaseUser(FireBaseUser user){
  //   return user != null ? User(uid: user.uid) : null;
  // }

  // Stream<User> get user{
  //   return _auth.onAuthStateChanged
  //   .map(_userFromFirebaseUser);
  // }

  var _auth;

  Future<void> signUp(String? email, String? password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAVHqE7u8yppKBrrDBaDWKOYegoP7_xTy0';
    // const url = 'http://10.0.2.2:8000/api/users/register';

    try{
      final response = await http.post(Uri.parse(url), body: json.encode(
      {
        'email' : email,
        'password' : password,
        'returnSecureToken' : true,
      }
    ));
    final responseData = json.decode(response.body);

    // print(responseData);

    if(responseData['error'] != null )
    {
      throw HttpException(responseData['error']['message']);

    }
    } catch(error)
    {
      throw error;
    }

  }


  Future <void> logIn(String? email, String? password, ) async
  {
    // const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAVHqE7u8yppKBrrDBaDWKOYegoP7_xTy0';
    // const url = '192.168.0.28:8000/api/users/login';
    const url =  'http://10.0.2.2:8000/api/users/login';



    try{
final response = await http.post(Uri.parse(url), body: json.encode(
      {
        'email' : email,
        'password' : password,
        'returnSecureToken' : true,
      }
    ));
    final responseData = json.decode(response.body);
    if(responseData['error'] != null )
    {
      throw HttpException(responseData['error']['message']);

    }
    // print(responseData);
  }catch(error)
  {
    throw error;
  }
    
  }

  Future signOut() async{
    try {
            return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}

