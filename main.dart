import 'package:flutter/material.dart';
import 'screens/home.dart';
void main(){
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}