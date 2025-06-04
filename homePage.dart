import 'package:flutter/material.dart';
import 'aboutPage.dart';
import 'calculator.dart';
import 'info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Map<String, dynamic>> items = [
    {
      "icon": "images/house (1).png",
      "label": "HOME",
      "page": null, // No navigation needed
    },
    {
      "icon": "images/information.png",
      "label": "ABOUT",
      "page": const AboutPage(),
    },
    {
      "icon": "images/boy.png",
      "label": "INFO",
      "page": const InfoPage(),
    },
    {
      "icon": "images/calculator.png",
      "label": "CALCULATOR",
      "page": const CalculatorPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                if (item["page"] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item["page"]),
                  );
                }
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item["icon"], height: 80, width: 80),
                    const SizedBox(height: 10),
                    Text(
                      item["label"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
