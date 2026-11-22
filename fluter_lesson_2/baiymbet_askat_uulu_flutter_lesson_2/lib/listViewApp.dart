import 'package:flutter/material.dart';

class ListViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext contex) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Список учеников'),
          backgroundColor: Colors.blueGrey,
        ),
        body:
         SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Студенты'),
              SizedBox(height: 20),
              Text('ФИО студентов\n'*35),
               SizedBox(height: 20),
               ElevatedButton(onPressed: (){}, child: Text('На главную'))
              /*Text('Artur'),
              Text('Arsen'),
              Text('Rodion'),
              Text('Baiymbet'),
              Text('Kanat'),*/
            ],
          ),
        ),
      ),
    );
  }
}

class StateLessWidget {}
