import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Обратная связь'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Напишите нам',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Введите ваше имя и нажмите кнопку отправки.'),
               SizedBox(height: 20),
               FeedbackForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  State<FeedbackForm> createState() => FeedbackFormState();
}

class FeedbackFormState extends State<FeedbackForm> {

  String name = '';
    bool isSent = false;
  final TextEditingController nameController = TextEditingController();
  String resultText = '';
  

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'Ваше имя',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            name = value;
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: (){
            if (name.trim().isNotEmpty){
              setState(() {
                isSent = true;
              });
              nameController.clear();
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
          foregroundColor: Colors.black),
          child: Text('Отправить', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold ),),
        ),
        SizedBox(height: 20),
        Text('Отправено! Спасибо, $name.', 
        style: TextStyle(fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.green),),
      ],
    );
  }
}
