import 'package:debts/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 183, 203, 219),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 27, 30, 32),
          elevation: 0,
          title: Text('Sign in to Debts Manager'),
          actions: [
            TextButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.green,
                  ),
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
          child: SingleChildScrollView(
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
          
                      // Elevated Button For Signinig In.
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.all(15.0)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _auth.signInWithEmailAndPassword(email, password);
                            }
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'dont have an account',
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
                                'SignUp',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ))
                        ],
                      ))
                    ],
                  )),
            ),
          ),
        ));
  }
}
