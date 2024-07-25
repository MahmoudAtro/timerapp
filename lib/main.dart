import 'package:flutter/material.dart';
import 'package:timer/widgets/HomePage.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: HomePage(),
      title: "Timer App",
    );
  }
}