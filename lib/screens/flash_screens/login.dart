import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:min_assist/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter an email' : null,
                    onChanged: (val) {
                      setState(() {
                        _email = val.trim();
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (val) =>
                        val!.length < 6 ? 'Password must be at least 6 characters' : null,
                    onChanged: (val) {
                      setState(() {
                        _password = val.trim();
                      });
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          UserCredential result = await _auth
                              .signInWithEmailAndPassword(_email, _password);
                          Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            _error = e.message!;
                          });
                        }
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    _error,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
