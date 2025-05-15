import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/appbar.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(
              title: Text('Wallet'),
            )
          ],
        ),
      ),
    );
  }
}
