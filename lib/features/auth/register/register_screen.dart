import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

  static const valueKey = ValueKey('RegisterScreen');

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Text('register'),
      ),
    );
  }
}

