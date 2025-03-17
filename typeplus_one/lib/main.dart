import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:typeplus_one/ui/main_screen.dart';
import 'package:typeplus_one/services/worker.dart';
import 'package:typeplus_one/state/modifier_keys.dart';
import 'package:typeplus_one/ui/side_pane.dart';
import 'package:typeplus_one/ui/search_bar.dart';

void main() {
  runApp(const ProviderScope(child: TypePlusApp()));
}

class TypePlusApp extends StatelessWidget {
  const TypePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
