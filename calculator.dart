import 'package:flutter/material.dart';
import 'mainPage.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController fundController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController monthsController = TextEditingController();

  double? totalDividend;

  void calculateDividend() {
    final double? fund = double.tryParse(fundController.text);
    final double? rate = double.tryParse(rateController.text);
    final int? months = int.tryParse(monthsController.text);

    if (fund != null && rate != null && months != null && months <= 12) {
      double monthlyDividend = (rate / 100 / 12) * fund;
      double result = monthlyDividend * months;

      setState(() {
        totalDividend = result;
      });
    } else {
      setState(() {
        totalDividend = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid numbers (Months ≤ 12)")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dividend Calculator'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Calculate your investment dividend',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Invested Fund
            TextField(
              controller: fundController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Invested Fund Amount (MYR)',
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Annual Rate
            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Annual Dividend Rate (%)',
                prefixIcon: Icon(Icons.percent),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            // Number of Months
            TextField(
              controller: monthsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Number of Months (max 12)',
                prefixIcon: Icon(Icons.calendar_month),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),

            ElevatedButton.icon(
              icon: const Icon(Icons.calculate),
              label: const Text('Calculate'),
              onPressed: calculateDividend,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 30),

            if (totalDividend != null)
              Card(
                elevation: 5,
                color: Colors.indigo.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Total Dividend',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'MYR ${totalDividend!.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 24, color: Colors.indigo, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },
        tooltip: 'Back',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
