import 'package:flutter/material.dart';
import 'package:typeplus_one/ui/custom_icons.dart';

class ModeData {
  final String mode;
  final IconData normalIcon;
  final IconData hotkeyIcon;

  ModeData(this.mode, this.normalIcon, this.hotkeyIcon);
}

final List<ModeData> modes = [
  ModeData('Emoji', Icons.emoji_emotions, AlphabetIcons.E),
  ModeData('Unicode', Icons.file_present, AlphabetIcons.U),
  ModeData('Math', Icons.data_saver_on, AlphabetIcons.M),
  ModeData('LaTeX', Icons.barcode_reader, AlphabetIcons.L),
  ModeData('Clipboard', Icons.paste, AlphabetIcons.C),
];
