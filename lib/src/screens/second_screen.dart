import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
         appBar: AppBar(
           title: Text("Second Screen"),
    ),
    body: Container(
      margin:EdgeInsets.all(16),
      color: Colors.greenAccent,
         child: Center(
             child: Text("This is the second screen"),
    ),
    ),
    ));

  }
}
