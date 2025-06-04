import 'package:flutter/material.dart';
import 'mainPage.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile picture
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('images/zulfan.jpg'), // Replace with your profile image path
              ),
              const SizedBox(height: 20),

              // Name
              const Text(
                'Zulfan Wadihan Zulkefli',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // Matric No and Class
              const SizedBox(height: 5),
              const Text(
                'Matric No: 2024767275',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Text(
                'Class: RCDCS 2515A',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Text(
                'Course: NETCENTRIC COMPUTING',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 20),

              // Email (optional)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.email, color: Colors.indigo),
                  SizedBox(width: 8),
                  Text(
                    '2024767275n@student.uitm.edu.my',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // About Me section
              const Text(
                'About Me',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'I am a passionate and dedicated student exploring mobile app development with Flutter.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40),

              // Back button
              ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text('Back to Main Page'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

