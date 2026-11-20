import 'package:flutter/material.dart';

class TemperatureApp extends StatefulWidget {
  @override
  State<TemperatureApp> createState() => TemperatureAppState();
}

class TemperatureAppState extends State<TemperatureApp> {
  int temp = 0;

  @override
  Widget build(BuildContext contex) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Счетчик температуры'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Температура', style: TextStyle(fontSize: 24)),
              SizedBox(height: 8),

              Text(
                '$temp градусов',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: temp > 0 ? Colors.red : Colors.blue,
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temp--;
                      });
                    },
                    child: Text('Уменшить'),
                  ),

                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temp++;
                      });
                    },
                    child: Text('Увеличить'),
                    
                  ),
                  
                    SizedBox(width: 20),
                     
                       ElevatedButton(
                    onPressed: () {
                      setState(() {
                        temp = 0;
                      });
                    },
                    child: Text('Сброс'),),
       
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
