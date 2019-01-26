import 'package:flutter/material.dart';
import 'screens/login_screenBLOC.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  build(context) {
    return Provider(
      child: MaterialApp(
        title: 'Login Screen BLOC',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
