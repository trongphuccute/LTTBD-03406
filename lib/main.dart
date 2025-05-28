import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Components',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/components': (context) => ComponentListScreen(),
        '/textDetail': (context) => TextDetailScreen(),
        '/imageDetail': (context) => ImageDetailScreen(),
        '/inputDetail': (context) => InputDetailScreen(),
        '/layoutDetail': (context) => LayoutDetailScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(size: 100),
              SizedBox(height: 20),
              Text(
                "Jetpack Compose",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "Jetpack Compose is a modern UI toolkit for\n"
                "building native Android applications using\n"
                "a declarative programming approach.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/components');
                },
                child: Text("I'm Ready"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ComponentListScreen extends StatelessWidget {
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget componentBox({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.lightBlue[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.black87)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Components List")),
      body: ListView(
        children: [
          sectionTitle("Display"),
          componentBox(
            title: "Text",
            subtitle: "Displays text",
            onTap: () => Navigator.pushNamed(context, '/textDetail'),
          ),
          componentBox(
            title: "Image",
            subtitle: "Displays an image",
            onTap: () => Navigator.pushNamed(context, '/imageDetail'),
          ),
          sectionTitle("Input"),
          componentBox(
            title: "TextField",
            subtitle: "Input field for text",
            onTap: () => Navigator.pushNamed(context, '/inputDetail'),
          ),
          componentBox(
            title: "PasswordField",
            subtitle: "Input field for passwords",
            onTap: () => Navigator.pushNamed(context, '/inputDetail'),
          ),
          sectionTitle("Layout"),
          componentBox(
            title: "Column",
            subtitle: "Arranges elements vertically",
            onTap: () => Navigator.pushNamed(context, '/layoutDetail'),
          ),
          componentBox(
            title: "Row",
            subtitle: "Arranges elements horizontally",
            onTap: () => Navigator.pushNamed(context, '/layoutDetail'),
          ),
        ],
      ),
    );
  }
}


class TextDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Detail")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 20, color: Colors.black),
              children: [
                TextSpan(text: 'The '),
                TextSpan(
                  text: 'quick ',
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
                TextSpan(
                  text: 'Brown\n',
                  style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'fox '),
                TextSpan(text: 'j '),
                TextSpan(text: 'u '),
                TextSpan(text: 'm '),
                TextSpan(text: 'p '),
                TextSpan(text: 's '),
                TextSpan(
                  text: 'over\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'the '),
                TextSpan(
                  text: 'lazy ',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(text: 'dog.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class ImageDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Detail")),
      body: Center(
        child: Image.network(
          'https://flutter.dev/images/flutter-logo-sharing.png',
          width: 200,
        ),
      ),
    );
  }
}

class InputDetailScreen extends StatefulWidget {
  @override
  _InputDetailScreenState createState() => _InputDetailScreenState();
}

class _InputDetailScreenState extends State<InputDetailScreen> {
  final _controller = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Fields")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'TextField'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: _obscure,
              decoration: InputDecoration(
                labelText: 'PasswordField',
                suffixIcon: IconButton(
                  icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() => _obscure = !_obscure);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LayoutDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout Examples")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Column Example:"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item 1"),
                Text("Item 2"),
                Text("Item 3"),
              ],
            ),
            SizedBox(height: 20),
            Text("Row Example:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("A"),
                Text("B"),
                Text("C"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
