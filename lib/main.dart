import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnboardingModel {
  final String title;
  final String description;
  final String imageAsset;
  final String subtitle;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.subtitle,
  });
}

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: "Easy Management",
      description: "Easily manage your tasks and activities in one app.",
      imageAsset: "assets/onboarding1.png",
      subtitle:"",
    ),
    OnboardingModel(
      title: "Easy Managemen",
      description: "Stay organized with your smart daily schedule.",
      imageAsset: "assets/onboarding2.png",
      subtitle: "with management based on priotity and daily task, it will give you convenience in managing and determining the task that must be done first",
    ),
    OnboardingModel(
      title: "Increase work Effectiveness",
      description: "View and analyze your work statistics.",
      imageAsset: "assets/onboarding3.png",
      subtitle: "time management and the determination of more important task will give your jo statistics better and alwways improve",
    ),
    OnboardingModel(
      title: "Reminder Notification",
      description: "Your data is safe with our advanced encryption.",
      imageAsset: "assets/onboarding4.png",
      subtitle: "The advantage of this application is that it also provides reminders for you so you don`t forget to keep doing yuor assignment well and according to the time you have set",
    ),
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Navigate to home or login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final page = pages[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(page.imageAsset, height: 300),
                const SizedBox(height: 24),
                Text(
                  page.title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  page.subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _nextPage,
                  child: Text(_currentPage == pages.length - 1 ? "Start" : "Next"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
