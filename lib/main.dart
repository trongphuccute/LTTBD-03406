import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: EmailCheckApp()));
}

class EmailCheckApp extends StatefulWidget {
  @override
  _EmailCheckAppState createState() => _EmailCheckAppState();
}

class _EmailCheckAppState extends State<EmailCheckApp> {
  final TextEditingController emailController = TextEditingController();
  String message = '';

  void checkEmail() {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        message = 'Email không hợp lệ';
      });
    } else if (!email.contains('@')) {
      setState(() {
        message = 'Email không đúng định dạng';
      });
    } else {
      setState(() {
        message = 'Bạn đã nhập email hợp lệ';
      });
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thực hành 02')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              key: Key('emailField'),
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              key: Key('checkButton'),
              onPressed: checkEmail,
              child: Text('Kiểm tra'),
            ),
            SizedBox(height: 20),
            Text(
              message,
              key: Key('resultText'),
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
