import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hotkeyProvider =
    StateNotifierProvider<HotkeyNotifier, Set<LogicalKeyboardKey>>(
      (ref) => HotkeyNotifier(),
    );

typedef HotkeyCallback = void Function();

class HotkeyNotifier extends StateNotifier<Set<LogicalKeyboardKey>> {
  final Map<Set<LogicalKeyboardKey>, HotkeyCallback> _hotkeyActions = {};

  HotkeyNotifier() : super({}) {
    _initKeyListener();
  }

  void _initKeyListener() {
    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  bool _handleKeyEvent(KeyEvent event) {
    final isKeyDown = event is KeyDownEvent;
    final key = event.logicalKey;

    if (isKeyDown) {
      state = {...state, key}; // Add key to the set
    } else {
      state = state.where((k) => k != key).toSet(); // Remove key from the set
    }

    _triggerHotkey(); // Check if a registered hotkey is triggered
    return false;
  }

  void registerHotkey(Set<LogicalKeyboardKey> keys, HotkeyCallback callback) {
    _hotkeyActions[keys] = callback;
  }

  void unregisterHotkey(Set<LogicalKeyboardKey> keys) {
    _hotkeyActions.remove(keys);
  }

  void _triggerHotkey() {
    for (var entry in _hotkeyActions.entries) {
      if (entry.key.every((key) => state.contains(key))) {
        entry.value();
      }
    }
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    super.dispose();
  }
}
