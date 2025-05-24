import 'package:flutter/material.dart';
import 'card_details_page.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String selectedMethod = "credit"; // Default selected method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          RadioListTile(
            value: "credit",
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value!;
              });
            },
            title: const Text("Credit Card"),
            subtitle: const Text("1234 **** **** 1234"),
          ),
          const Divider(),
          RadioListTile(
            value: "paypal",
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value!;
              });
            },
            title: const Text("Paypal"),
            subtitle: const Text("email@website.com"),
          ),
          const Divider(),
          RadioListTile(
            value: "apple",
            groupValue: selectedMethod,
            onChanged: (value) {
              setState(() {
                selectedMethod = value!;
              });
            },
            title: const Text("Apple Pay"),
            subtitle: const Text("email@website.com"),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddCardPage()));
              },
              child: const Text("Continue"),
            ),
          )
        ],
      ),
    );
  }
}
