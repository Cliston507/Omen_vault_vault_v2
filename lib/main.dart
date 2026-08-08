import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize RevenueCat SDK
    await Purchases.configure(PurchasesConfiguration("goog_test_placeholder_key"));
      await Purchases.logIn("USER_UNIQUE_ID");
      


  runApp(const OmenVaultApp());
}

class OmenVaultApp extends StatelessWidget {
  const OmenVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omen Vault',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child: Text('Omen Vault v2 Initialized'),
        ),
      ),
    );
  }
}
