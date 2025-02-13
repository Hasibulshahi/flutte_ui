import 'package:flutte_ui/models/user_model.dart';
import 'package:flutte_ui/views/profile_view.dart';
import 'package:flutte_ui/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'views/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  UserModel userModel = UserModel(
    employeeID: 100,
    firstName: 'Hasibul',
    lastName: 'Hassan',
    email: 'hasibul@abc.co',
    phone: '123565548',
    password: ''
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginView(),
    );
  }
}
