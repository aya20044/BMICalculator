import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/calculation.dart';
class HomeScreen extends StatelessWidget{
  @override
  Widget build (BuildContext context ){
    return Scaffold(
      body: InkWell(
        onTap:(){
          Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder:(context)=>CalculationScreen())
          );
        },
        child:Container(
          color: const Color(0xFF00A597),
          alignment: Alignment.center,
            child: const CircleAvatar(
              radius:112,
              backgroundImage: AssetImage('images/apple2.jpg'),
            ),
          ),
        ),

    );
  }
}