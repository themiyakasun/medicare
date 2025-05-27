import 'package:flutter/material.dart';
import 'package:medicare/features/personalization/screens/wallet/payment_method_page.dart';

class WalletScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {"name": "Dr. Emma Mia", "date": "Oct 26, 2022", "amount": 200},
    {"name": "Dr. Phillip Rosser", "date": "Oct 27, 2022", "amount": 250},
    {"name": "Dr. Alfredo Geidt", "date": "Oct 28, 2022", "amount": 350},
    {"name": "Dr. Leo Levin", "date": "Oct 30, 2022", "amount": 150},
  ];
  WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B0D75),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Your Balance",
                        style: TextStyle(color: Colors.white70)),
                    const SizedBox(height: 8),
                    const Text("\$1000",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 45),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PaymentMethodPage()));
                      },
                      child: const Text("Add Payment"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text("Recent Transactions",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final tx = transactions[index];
                    return ListTile(
                      leading: const CircleAvatar(backgroundColor: Colors.grey),
                      title: Text(tx['name']),
                      subtitle: Text(tx['date']),
                      trailing: Text(
                        "\$${tx['amount']}",
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
