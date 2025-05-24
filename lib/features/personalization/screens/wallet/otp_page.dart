import 'package:flutter/material.dart';
import 'receipt_page.dart';

class OtpPage extends StatelessWidget {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());

  OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("OTP Authentication"),
            Text("An authentication code has been sent to your email"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _otpControllers
                  .map((controller) => SizedBox(
                        width: 50,
                        child: TextField(
                          controller: controller,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ))
                  .toList(),
            ),
            TextButton(onPressed: () {}, child: Text("Resend")),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ReceiptPage()));
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
