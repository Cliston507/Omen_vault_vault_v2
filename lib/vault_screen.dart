import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'main.dart';
import 'paywall_screen.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  State<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  final LocalAuthentication _auth = LocalAuthentication();
  final SecurityService _security = SecurityService();
  final TextEditingController _textController = TextEditingController();
  
  bool _isAuthenticated = false;
  String _storedSecret = 'No secret loaded';

  Future<void> _authenticateUser() async {
    final bool didAuthenticate = await _auth.authenticate(
      localizedReason: 'Authenticate to access your secure Omen Vault',
      options: const AuthenticationOptions(biometricOnly: false),
    );
    setState(() => _isAuthenticated = didAuthenticate);
  }

  Future<void> _saveSecret() async {
    if (_textController.text.isNotEmpty) {
      await _security.secureStore(key: 'user_vault_key', value: _textController.text);
      _textController.clear();
      _loadSecret();
    }
  }

  Future<void> _loadSecret() async {
    final secret = await _security.secureRead(key: 'user_vault_key');
    setState(() => _storedSecret = secret ?? 'Vault empty');
  }

  @override
  Widget build(BuildContext context) {
    if (!_isAuthenticated) {
      return Scaffold(
        appBar: AppBar(title: const Text('Omen Vault Locked')),
        body: Center(
          child: ElevatedButton.icon(
            onPressed: _authenticateUser,
            icon: const Icon(Icons.fingerprint),
            label: const Text('Unlock Vault'),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Omen Vault Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PaywallScreen()),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Enter Secret to Store in RAM Vault',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _saveSecret,
              child: const Text('Save to Secure Vault'),
            ),
            const Divider(height: 32),
            Text('Stored Value: $_storedSecret', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
