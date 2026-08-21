l      limport 'package:flutter/material.dart';
import 'vault_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
                                                        scaffoldBackgroundColor: const Color(0xFF121212),
                                                                appBarTheme: const AppBarTheme(
                                                                          backgroundColor: Color(0xFF1E1E1E),
                                                                                    elevation: 0,
                                                                                              centerTitle: true,
                                                                                                      ),
                                                                                                            ),
                                                                                                                  home: const VaultScreen(),
                                                                                                                      );
                                                                                                                        }
                                                                                                                        }


                                                                                                                        ,
                                                                                                                      );
                                                                                                    