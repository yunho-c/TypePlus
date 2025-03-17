import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:typeplus_one/ui/main_screen.dart';
import 'package:typeplus_one/services/worker.dart';
import 'package:typeplus_one/state/modifier_keys.dart';
import 'package:typeplus_one/services/window.dart';
import 'package:typeplus_one/ui/side_pane.dart';
import 'package:typeplus_one/ui/search_bar.dart';
import 'package:typeplus_one/themes.dart';

void main() async {
  configureWindow();
  registerWindowMgmtHotkeys();
  runApp(const ProviderScope(child: TypePlusApp()));
}

class TypePlusApp extends StatelessWidget {
  const TypePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: mainTheme, home: const MainScreen());
  }
}
