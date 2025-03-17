import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final modifierKeysProvider =
    StateNotifierProvider<ModifierKeysNotifier, String>((ref) {
      return ModifierKeysNotifier();
    });

class ModifierKeysNotifier extends StateNotifier<String> {
  ModifierKeysNotifier() : super('None') {
    _initKeyListener();
  }

  void _initKeyListener() {
    // Add listener to the HardwareKeyboard singleton
    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  // Handle key events and return true if the event was handled
  bool _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent || event is KeyUpEvent) {
      final isKeyDown = event is KeyDownEvent;

      // Check for Control keys
      if (event.logicalKey == LogicalKeyboardKey.controlLeft ||
          event.logicalKey == LogicalKeyboardKey.controlRight) {
        state = isKeyDown ? 'Ctrl' : 'None';
        return true;
      }
      // Check for Shift keys
      else if (event.logicalKey == LogicalKeyboardKey.shiftLeft ||
          event.logicalKey == LogicalKeyboardKey.shiftRight) {
        state = isKeyDown ? 'Shift' : 'None';
        return true;
      }
      // Check for Alt keys
      else if (event.logicalKey == LogicalKeyboardKey.altLeft ||
          event.logicalKey == LogicalKeyboardKey.altRight) {
        state = isKeyDown ? 'Alt' : 'None';
        return true;
      }
      // Check for Meta/Command keys
      else if (event.logicalKey == LogicalKeyboardKey.metaLeft ||
          event.logicalKey == LogicalKeyboardKey.metaRight) {
        state = isKeyDown ? 'Cmd' : 'None';
        return true;
      }
    }

    // Return false if the event wasn't handled
    return false;
  }

  @override
  void dispose() {
    // Remove the handler when the StateNotifier is disposed
    HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    super.dispose();
  }
}
