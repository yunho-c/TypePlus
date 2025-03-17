import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:typeplus_one/ui/custom_icons.dart';

class ModeData {
  final String mode;
  final IconData normalIcon;
  final IconData hotkeyIcon;
  final LogicalKeyboardKey hotkey;

  ModeData(this.mode, this.normalIcon, this.hotkeyIcon, this.hotkey);
}

final List<ModeData> modes = [
  ModeData('Emoji', Icons.emoji_emotions, AlphabetIcons.E, LogicalKeyboardKey.keyE),
  ModeData('Unicode', Icons.file_present, AlphabetIcons.U, LogicalKeyboardKey.keyU),
  ModeData('Math', Icons.data_saver_on, AlphabetIcons.M, LogicalKeyboardKey.keyM),
  ModeData('LaTeX', Icons.barcode_reader, AlphabetIcons.L, LogicalKeyboardKey.keyL),
  ModeData('Clipboard', Icons.paste, AlphabetIcons.C, LogicalKeyboardKey.keyC),
];
