import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'omen_tools.dart';

class OmenAgentService {
  late final GenerativeModel _model;
  final String apiKey;

  OmenAgentService({required this.apiKey}) {
    _model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: apiKey,
      tools: omenSecurityTools,
      systemInstruction: Content.system(
        'You are AI Omen Oracle, an autonomous cybersecurity agent inside Omen Vault. '
        'Analyze raw telemetry logs for brute-force attacks, signature tampering, or geographical anomalies. '
        'If an active threat is detected, execute appropriate defensive functions immediately.',
      ),
    );
  }

  Future<void> processTelemetry(String rawTelemetryJson) async {
    final chat = _model.startChat();
    final response = await chat.sendMessage(
      Content.text('Incoming security telemetry payload: $rawTelemetryJson'),
    );

    if (response.functionCalls.isNotEmpty) {
      for (final call in response.functionCalls) {
        await _executeDefensiveAction(call.name, call.args);
      }
    }
  }

  Future<void> _executeDefensiveAction(String functionName, Map<String, dynamic> args) async {
    debugPrint('🛡️ [AUTONOMOUS ACTION EXECUTED]: $functionName -> $args');
    
    switch (functionName) {
      case 'quarantineVaultKey':
        // Updates local vault status to QUARANTINED
        break;
      case 'revokeSessionToken':
        // Invalidates active session
        break;
      case 'dispatchPushAlert':
        // Emits diagnostic alert
        break;
    }
  }
}
