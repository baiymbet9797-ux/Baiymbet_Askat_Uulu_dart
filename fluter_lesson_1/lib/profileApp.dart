import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ProfilePage());
  }
}

class ProfilePage extends StatelessWidget {
  final String name = 'Baiymbet Askat';
  final String city = "I'm from Bishkek";
  final String age = "I'm 29";
  final String interest = 'I like learning Programming.\nIn my free time, I like to repair car engines.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 255, 0),
        title: Text('Profile'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/wolf.jpg'),
            ),
            SizedBox(height: 16),

            Text(
              name,
              style: TextStyle(
                fontFamily: 'MomoSignature-Regular',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),

            Text(
              age,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),

            Text(
              city,
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                ),
            ),
            SizedBox(height: 20
            ),

            Text(
              textAlign: TextAlign.center,
              interest,
              style: TextStyle(
                fontSize: 22, 
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 22, 248, 1),
                ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.message),
                  iconSize: 30,
                ),
                SizedBox(width: 16),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt),
                  iconSize: 30,
                ),
                SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.phone),
                  iconSize: 30,
                ),
              ],
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: Text('Follow',
               style: TextStyle(
                fontSize: 28)),
            ),
          ],
        ),
      ),
    );
  }
}
