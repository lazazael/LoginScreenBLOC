import 'package:flutter/material.dart';
import 'screens/login_screenBLOC.dart';

class App extends StatelessWidget {
  build(context) {
    return MaterialApp(
      title: 'Login Screen BLOC',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
