import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_vivah/ui/screens/get_started_screen.dart';
import 'package:virtual_vivah/ui/screens/try.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Virtual Vivah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF000000),
        unselectedWidgetColor: Colors.pink,
      ),
      home: const GettingStartedScreen(),
    );
  }
}

