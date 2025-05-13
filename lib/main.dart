

import 'package:flutter/material.dart';

void main() {
  runApp(Profile_app());
}

class Profile_app extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext conteXt) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Profile_app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage:  AssetImage(
               // ignore: unnecessary_string_escapes
               'd:\Profile_app\assets\depzai.png',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Huỳnh Trọng Phúc',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Bình Tân, tpHCM',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ), 
          ],
        )
      ),
    );
    return scaffold;
  }
}

