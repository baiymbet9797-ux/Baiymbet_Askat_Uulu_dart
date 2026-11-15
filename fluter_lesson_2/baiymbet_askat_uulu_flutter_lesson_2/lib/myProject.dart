import 'package:flutter/material.dart';

class MyProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ProjectPage());
  }
}

class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title:  Row(
          children: [
            Text('Виджеты компоновки'),
            Spacer(),
            
            Icon(Icons.search),
            SizedBox( width: 16),
            Icon(Icons.menu),
          ],),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                height: 120,
                color: Colors.blue,
                child: Center(
                  child: Text('A', style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),),
                ),
              ),),
              
              SizedBox(width: 8),

              Expanded(
                flex: 2,
                child: Container(
                height: 120,
                color: Colors.orange,
                child: Center(
                  child: Text('B', style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),),
                ),
              ), ),
               
              SizedBox(width: 8,),

              Expanded(
                flex: 5,
                child:  Container(
                height: 120,
                color: Colors.green,
                child: Center(
                  child: Text('C', style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),),
                ),
              ),)
            ],
          ),
          SizedBox(height: 30),
           Row(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                height: 120,
                color: Colors.blue,
                child: Center(
                  child: Text('A', style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),),
                ),
              ),),
              
              SizedBox(width: 8),

              Flexible(
                flex: 2,
                child: Container(
                height: 120,
                color: Colors.orange,
                child: Center(
                  child: Text('B', style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),),
                ),
              ), ),
               
              SizedBox(width: 8,),

              Flexible(
                flex: 5,
                child:  Container(
                height: 120,
                width: 350,
                color: Colors.green,
                child: Center(
                  child: Text('C', style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  ),),
                ),
              ),)
            ],
          ),
          SizedBox(height: 30),
          //Stack
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                   CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 60, color: Colors.white,),
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
              ))  
                ],
              )
           
            ],
          )
        ],
      ),),
    );
  }
}
