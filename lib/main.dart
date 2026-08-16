import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'paywall_screen.dart';
import 'package:memguard/memguard.dart';



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

      home: const PaywallScreen(),

   );
    );
            
class SecurityService {
  final MemGuardCore _vault = MemGuardCore();

  Future<void> secureStore({required String key, required String value}) async {
    await _vault.write(key: key, value: value);
  }

  Future<String?> secureRead({required String key}) async {
    return await _vault.read(key: key);
  }

  Future<void> secureWipe({required String key}) async {
    await _vault.delete(key: key);
  }
}
