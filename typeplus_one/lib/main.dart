import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:typeplus_one/ui/main_screen.dart';
import 'package:typeplus_one/services/worker.dart';
import 'package:typeplus_one/state/modifier_keys.dart';
import 'package:typeplus_one/ui/side_pane.dart';
import 'package:typeplus_one/ui/search_bar.dart';
import 'package:typeplus_one/themes.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(1000, 400),
    center: true,
    // alwaysOnTop: true,
    backgroundColor: Colors.transparent,
    // skipTaskbar: true,
    title: 'TypePlus',
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const ProviderScope(child: TypePlusApp()));
}

class TypePlusApp extends StatelessWidget {
  const TypePlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: mainTheme, home: const MainScreen());
  }
}
