// mainPage.dart
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'aboutPage.dart';
import 'info.dart';
import 'calculator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key}); // ✅ add const constructor

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: const Color(0xFFF0F0F0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            switch (index) {
              case 0:
                // Navigate to Home
                break;
              case 1:
                // Navigate to About
                break;
              case 2:
                // Navigate to Info
                break;
              case 3:
                // Navigate to Calculator
                break;
            }
          });
        },
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
        ],
      ),
      body: getBodyWidget(),
    );
  }

  Widget getBodyWidget() {
    if (currentIndex == 0) {
      return HomePage();
    }
    if (currentIndex == 1) {
      return AboutPage();
    }
    if (currentIndex == 2) {
      return InfoPage();
    }
    if (currentIndex == 3) {
      return CalculatorPage();
    }
  
    // Add more conditions for other indices if needed
    return Container(); // Default empty container
  }
}
