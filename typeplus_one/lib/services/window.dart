import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import 'package:typeplus_one/state/hotkey.dart';
import 'package:flutter/services.dart';

void configureWindow() async {
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
}

void toggleWindowVisibility() async {
  if (await windowManager.isVisible()) {
    await windowManager.hide();
  } else {
    await windowManager.show();
  }
}

void registerWindowMgmtHotkeys() async {
  final container = ProviderContainer();
  final hotkeyNotifier = container.read(hotkeyProvider.notifier);

  // show and hide
  hotkeyNotifier.registerHotkey({
    // LogicalKeyboardKey.control,
    // LogicalKeyboardKey.alt,
    // LogicalKeyboardKey.meta,
    LogicalKeyboardKey.controlLeft,
    LogicalKeyboardKey.altLeft,
    LogicalKeyboardKey.metaLeft,
    LogicalKeyboardKey.space,
  // }, () => print('Window visibility toggle triggered'));
  }, () => toggleWindowVisibility());

  hotkeyNotifier.registerHotkey({
    LogicalKeyboardKey.shiftLeft,
    LogicalKeyboardKey.enter,
  }, () => print('Shift + Enter pressed!'));
}
