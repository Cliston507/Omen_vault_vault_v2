import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memguard/memguard.dart';

import 'paywall_screen.dart';
import 'vault_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Purchases.configure(
    PurchasesConfiguration("test_XoCLiphRBnOHVkZeRVmnycNsX1W"),
  );

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const VaultScreen(),
    );
  }
}

class SecurityService {
  final MemGuard _memGuard = MemGuard();

  Future<void> secureStore({required String key, required String value}) async {
    await _memGuard.write(key: key, value: value);
  }

  Future<String?> secureRead({required String key}) async {
    return await _memGuard.read(key: key);
  }
}
