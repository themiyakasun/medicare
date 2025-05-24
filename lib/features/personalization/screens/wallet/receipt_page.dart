import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          "Top Up Receipt",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 1,
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // 👈 Small gap between title and grid
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 650,
              margin: EdgeInsets.symmetric(
                  horizontal: 20), // 👈 Reduced side-only margin
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.orange, width: 3),
                    ),
                    child: Icon(Icons.verified, color: Colors.orange, size: 50),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Transaction Successful",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Your top up has been successfully done",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Text("Total Top Up",
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  SizedBox(height: 10),
                  Text(
                    "\$200.00",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.credit_card, color: Colors.orange),
                      ),
                      title: Text("Standard Chartered Card"),
                      subtitle: Text("1234 5678 2345"),
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.popUntil(context, (route) => route.isFirst),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Close"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
