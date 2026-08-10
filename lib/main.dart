import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Purchases.configure(PurchasesConfiguration("test_XoCLIphRBnOHVkZeRVmnycNsX1W"));

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
