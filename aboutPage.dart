import 'package:flutter/material.dart';
import 'mainPage.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Dividend Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About the App',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              'The Dividend Calculator App is designed to help investors '
              'quickly calculate potential returns from dividend-paying stocks. '
              'Whether you are a beginner or a seasoned investor, this app makes '
              'it easy to estimate your passive income from dividends.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            const Text(
              'Features',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const FeatureBullet(text: '📊 Easy-to-use dividend calculator interface'),
            const FeatureBullet(text: '💰 Calculate annual and monthly dividend income'),
            const FeatureBullet(text: '📈 Visual summary of potential earnings'),
            const FeatureBullet(text: '🔒 No internet required – works offline'),
            const FeatureBullet(text: '📁 Save and load multiple calculations'),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: const Text('Back to Main Page'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureBullet extends StatelessWidget {
  final String text;

  const FeatureBullet({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
