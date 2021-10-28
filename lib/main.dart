// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Text(
                "Chart",
                textAlign: TextAlign.center,
              ),
              color: Colors.greenAccent,
              elevation: 10,
            ),
          ),
          Card(
            child: Text("Transaction"),
            color: Colors.pinkAccent,
            elevation: 10,
          )
        ],
      ),
    );
  }
}
