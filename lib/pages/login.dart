import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Sudah Login"),),
    );
  }
}