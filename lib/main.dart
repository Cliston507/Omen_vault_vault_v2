import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Purchases.configure(PurchasesConfiguration("test_XoCLIphRBnOHVkZeRVmnycNsX1W"));

      final user = FirebaseAuth.instance.currentUser;
if (user != null) {
  await Purchases.logIn(user.uid);
}

      


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
