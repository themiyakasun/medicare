import 'package:flutter/material.dart';
import 'enter_amount_page.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController nameController =
      TextEditingController(text: "Emma Mia");
  final TextEditingController cardController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  bool saveForFuture = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Account Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: cardController,
              decoration: const InputDecoration(
                labelText: "Card Number",
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(labelText: "Exp Date"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    decoration: const InputDecoration(labelText: "CVV"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: saveForFuture,
              onChanged: (bool? value) {
                setState(() {
                  saveForFuture = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text("Save this for future"),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EnterAmountPage()),
                );
              },
              child: const Text("Save Card"),
            )
          ],
        ),
      ),
    );
  }
}
