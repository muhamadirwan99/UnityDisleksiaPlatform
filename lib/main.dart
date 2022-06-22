import 'package:flutter/material.dart';
import 'package:unity_disleksia_platform/common/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unity Disleksia Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: myTextTheme,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("test"),
        ),
        body: Column(children: [Text("sdsd")],)),
    );
  }
}