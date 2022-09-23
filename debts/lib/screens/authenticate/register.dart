import 'package:debts/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 183, 203, 219),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 27, 30, 32),
          elevation: 0,
          title: Text('Sign up for Debts Manager'),
          actions: [
            TextButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
          child: Container(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          )),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Email is required';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'password',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          )),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Password is required';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),

                    //The Elevated Button for Registering
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.all(15.0)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result = _auth.registerWithEmailAndPassword(
                                email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Please Supply valid Credentials';
                              });
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have an account',
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 18.0,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              widget.toggleView();
                            },
                            child: Text(
                              'SignIn',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ))
                      ],
                    ))
                  ],
                )),
          ),
        ));
  }
}
