import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:provider/provider.dart';

import '../models/authentication.dart';
import 'login.dart';

class SignupScreen extends StatefulWidget {

  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

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

  Future <void> _submit() async
  {
    if(!_formKey.currentState!.validate())
    {
      return;
    }
    _formKey.currentState!.save();

    try{
      await Provider.of<Authentication>(context, listen: false).signUp(
      _authData['email'], 
      _authData['password']
      );

      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    } catch (error)
    {
      var errorMessage = 'Authentication Failed. Try again';
      _showErrorDialog(errorMessage);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),

        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Login'),
                Icon(Icons.person)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          )
        ]

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
                height:600,
                width: 320,
                padding: EdgeInsets.all(16),
                child: Form(
                  key:_formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        
                        Column(
                children: <Widget>[
                  Text("Welcome to Nduru",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  Text("Signup New Nduru account",
                  style: TextStyle(
                    fontSize: 15,
                    color:Colors.grey[700]
                  ),)
                ],
              ),

                          TextFormField(
                          decoration: InputDecoration(labelText: 'First Name'),
                          // keyboardType: TextInputType.pho,
                          validator: (value)
                          {
                            if(value!.isEmpty || value.length<=1)
                            {
                              return 'invalid Input';
                            }
                          return null;
                          },
                          onSaved: (value)
                          {

                          }

                    ),

                    TextFormField(
                          decoration: InputDecoration(labelText: 'Last Name'),
                          // keyboardType: TextInputType.pho,
                          validator: (value)
                          {
                            if(value!.isEmpty || value.length<=1)
                            {
                              return 'invalid Input';
                            }
                          return null;
                          },
                          onSaved: (value)
                          {

                          }

                    ),

                        
                        TextFormField(
                          decoration: InputDecoration(labelText: 'ID Number'),
                          // keyboardType: TextInputType.pho,
                          validator: (value)
                          {
                            if(value!.isEmpty || value.length<=4)
                            {
                              return 'invalid ID number';
                            }
                          return null;
                          },
                          onSaved: (value)
                          {

                          }

                    ),

                    TextFormField(
                          decoration: InputDecoration(labelText: 'Student ID No'),
                          // keyboardType: TextInputType.pho,
                          validator: (value)
                          {
                            if(value!.isEmpty || value.length<=1)
                            {
                              return 'invalid Student number';
                            }
                          return null;
                          },
                          onSaved: (value)
                          {

                          }

                    ),

                        //Phone number
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Phone No'),
                          // keyboardType: TextInputType.pho,
                          validator: (value)
                          {
                            if(value!.isEmpty || value.length<=9)
                            {
                              return 'invalid Phone number';
                            }
                          return null;
                          },
                          onSaved: (value)
                          {

                          }
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
                          controller: _passwordController,
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

                        //confirm Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value)
                          {
                            if(value!.isEmpty || value != _passwordController.text)
                            {
                              return 'Invalid Password';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                           
                          },
                        ),
                        SizedBox(
                          height: 30,

                        ),
                        RaisedButton(
                          child: Text(
                            'Signup'
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