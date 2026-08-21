import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'vault_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
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
                                                                                                    