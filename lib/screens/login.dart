import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'signup_screen.dart';
import 'home_screen.dart';
import '../models/authentication.dart';

class LoginScreen extends StatefulWidget {

  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(
      context: context, 
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text ('Okay'),
            onPressed: (){
              Navigator.of(ctx).pop();
            },
          )
        ],
      )
      );
  }

  Future<void> _submit() async
  {
    if (!_formKey.currentState!.validate())
    {
      return;
    }
    _formKey.currentState!.save();

    try{
      // await Provider.of<Authentication>(context, listen: false).logIn(
      //     _authData['email'], 
      //     _authData['password']
      // );

      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    } catch(error)
    {
      var errorMessage = 'Authentication Failed. Try again';
      _showErrorDialog(errorMessage);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Signup'),
                Icon(Icons.person_add)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlueAccent,
                  Colors.red
                ]
              )
            )
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height:300,
                width: 320,
                padding: EdgeInsets.all(16),
                child: Form(
                  key:_formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[


                         Column(
                children: <Widget>[
                  Text("Nduru",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("Login to your Nduru account",
                  style: TextStyle(
                    fontSize: 15,
                    color:Colors.grey[700]
                  ),)
                ],
              ),


                          //email
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if (value!.isEmpty || !value.contains('@'))
                            {
                              return 'Invalid email address';
                            }
                          return null;
                          },
                          onSaved: (value)
                          {
                            _authData['email'] = value!;
                          },
                          //Password
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value)
                          {
                            if(value!.isEmpty || value.length<=5)
                            {
                              return 'Invalid Password';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['password'] = value!;
                          },
                        ),
                        SizedBox(
                          height: 30,

                        ),
                        RaisedButton(
                          child: Text(
                            'Login'
                          ),
                          onPressed: ()
                          {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.red,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ),
            )
          )
        ],
      )
    );
  }
}