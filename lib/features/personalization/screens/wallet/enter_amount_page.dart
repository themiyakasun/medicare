import 'package:flutter/material.dart';
import 'otp_page.dart';

class EnterAmountPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController(text: "1000");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Enter Amount", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              decoration: InputDecoration(border: InputBorder.none),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => OtpPage()));
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
