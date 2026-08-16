import 'package:flutter/material.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Omen Vault Premium'),
        elevation: 0,
      ),
      body: SafeArea(
        child: RevenueCatUI.paywall(),
      ),
    );
  }
}
