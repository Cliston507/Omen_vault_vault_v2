import 'package:google_generative_ai/google_generative_ai.dart';

final List<Tool> omenSecurityTools = [
  Tool(functionDeclarations: [
    FunctionDeclaration(
      'quarantineVaultKey',
      'Immediately locks and isolates a specific vault encryption key upon detecting breach signals.',
      Schema(
        SchemaType.object,
        properties: {
          'keyId': Schema(SchemaType.string, description: 'The identifier of the compromised key.'),
          'reason': Schema(SchemaType.string, description: 'Technical rationale for key isolation.'),
          'threatLevel': Schema(
            SchemaType.string,
            enumValues: ['LOW', 'MEDIUM', 'HIGH', 'CRITICAL'],
            description: 'Assessed severity of the threat.',
          ),
        },
        requiredProperties: ['keyId', 'reason', 'threatLevel'],
      ),
    ),
    FunctionDeclaration(
      'revokeSessionToken',
      'Terminates an active user session and invalidates JWT tokens.',
      Schema(
        SchemaType.object,
        properties: {
          'sessionId': Schema(SchemaType.string, description: 'Target session identifier to revoke.'),
          'ipOrigin': Schema(SchemaType.string, description: 'IP address generating anomalous access.'),
        },
        requiredProperties: ['sessionId', 'ipOrigin'],
      ),
    ),
    FunctionDeclaration(
      'dispatchPushAlert',
      'Pushes a high-priority security alert to the client dashboard.',
      Schema(
        SchemaType.object,
        properties: {
          'title': Schema(SchemaType.string, description: 'Short alert header.'),
          'message': Schema(SchemaType.string, description: 'Detailed diagnostic incident breakdown.'),
        },
        requiredProperties: ['title', 'message'],
      ),
    ),
  ]),
];
