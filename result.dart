import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/calculation.dart';

class resultScreen extends StatefulWidget {
  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  @override
  Widget build(BuildContext context) {
    double bmiResult = 0.0;
    String healthString = '';
    String tip = '';
    String getHealthString() {
      bmiResult = (CalculationScreenState.weight) /
          ((CalculationScreenState.height * .01) *
              (CalculationScreenState.height * .01));
      if (bmiResult < 18.5) {
        healthString = 'Under Weighted';
        tip = 'Eat nutrient-rich, calorie-dense foods regularly.';
      } else if (bmiResult <= 24.9) {
        healthString = 'Normal';
        tip = 'Do exercises for more progress.';
      } else if (bmiResult <= 29.9) {
        healthString = 'Over Weighted';
        tip = 'You must follow a diet plan and engage in strength training !';
      } else {
        healthString = 'Obese';
        tip = 'You must contact a dietitian !!';
      }
      return healthString;
    }

    return Scaffold(
      backgroundColor: CalculationScreenState.c1,
      appBar: AppBar(
        backgroundColor: CalculationScreenState.c1,
        titleSpacing: -43,
        title: Text(
          'Your BMI Result',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: CalculationScreenState.c5,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: CalculationScreenState.c2,
              ),
              width: 400,
              height: 590,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getHealthString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: CalculationScreenState.c3,
                    ),
                  ),
                  Text(
                    bmiResult.toStringAsFixed(2),
                    style: TextStyle(
                      color: CalculationScreenState.c5,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      tip,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: CalculationScreenState.c5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CalculationScreen()));
            },
            minWidth: 380,
            height: 80,
            color: CalculationScreenState.c3,
            child: Text(
              'RE CALCULATE',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: CalculationScreenState.c5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
