import 'package:flutter/material.dart';
import 'package:login_app/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );

  }
}



