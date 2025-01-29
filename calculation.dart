import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/result.dart';

class CalculationScreen extends StatefulWidget {
  @override
  State<CalculationScreen> createState() => CalculationScreenState();
}

class CalculationScreenState extends State<CalculationScreen> {
  //colors
  static Color c1 = const Color(0xFF00132C);
  static Color c2 = const Color(0xFF303144);
  static Color c3 = const Color(0xFF00A597);
  static Color c4 = const Color(0xFF7F8282);
  static Color c5 = Colors.white;

  //used values
  static double height = 170.00;
  static double weight = 62.5;
  static int age = 15;
  static bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: c1,
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  genderComponent(
                    gender: 'MALE',
                    genderIcon: Icons.male,
                    onPressed: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  genderComponent(
                    gender: 'FEMALE',
                    genderIcon: Icons.female,
                    onPressed: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            bodyComponent(
              measurementName: 'HEIGHT',
              unit: ' CM',
              minVal: 100,
              maxVal: 220,
              number: height,
              onChanged: (val) {
                setState(() {
                  height = val;
                });
              },
            ),
            bodyComponent(
              measurementName: 'WEIGHT',
              unit: ' KG',
              minVal: 45,
              maxVal: 200,
              number: weight,
              onChanged: (val) {
                setState(() {
                  weight = val;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: c2,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const Text(
                      'AGE',
                      style: TextStyle(
                        color: Color(0xFF7F8282),
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$age',
                      style: TextStyle(
                        color: c5,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          iconSize: 40,
                          color: c3,
                          onPressed: () {
                            setState(() {
                              if (age > 0) age--;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 40,
                          color: c3,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 42),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultScreen(),
                  ),
                );
              },
              minWidth: 380,
              height: 80,
              color: c3,
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: c5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderComponent({
    required String gender,
    required IconData genderIcon,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        height: 150,
        minWidth: 150,
        color: (gender == 'MALE' && isMale) || (gender == 'FEMALE' && !isMale)
            ? c3
            : c2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genderIcon,
              size: 100,
              color: Colors.white,
            ),
            Text(
              gender,
              style: TextStyle(
                color: c5,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyComponent({
    required String measurementName,
    required String unit,
    required double minVal,
    required double maxVal,
    required double number,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: c2,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              measurementName,
              style: TextStyle(
                color: c4,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  number.toStringAsFixed(2),
                  style: TextStyle(
                    color: c5,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  unit,
                  style: TextStyle(
                    color: c5,
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Slider(
              value: number,
              onChanged: onChanged,
              min: minVal,
              max: maxVal,
              activeColor: c3,
            ),
          ],
        ),
      ),
    );
  }
}