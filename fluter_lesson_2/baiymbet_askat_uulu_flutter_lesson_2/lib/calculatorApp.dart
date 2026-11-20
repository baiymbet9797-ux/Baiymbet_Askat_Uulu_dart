import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  double result = 0;
  double get firstValue => double.tryParse(firstController.text) ?? 0;
  double get secondValue => double.tryParse(secondController.text) ?? 0;

  void resetCalculator() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мини-калькулятор'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите первое число',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите второе число',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue * secondValue;
                    });
                  },
                  child: Text('x', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (secondValue == 0) {
                        result = 0;
                      } else {
                        result = firstValue / secondValue;
                      }
                    });
                  },
                  child: Text('÷', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue + secondValue;
                    });
                  },
                  child: Text('+', style: TextStyle(fontSize: 24)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue - secondValue;
                    });
                  },
                  child: Text('-', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),

                  onPressed: (resetCalculator),
                  child: Text('Сброс', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Результат: $result',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
