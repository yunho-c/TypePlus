import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:typeplus_one/state/hotkey.dart';
import 'package:typeplus_one/search/modes.dart';

final selectedModeProvider = StateProvider<String>((ref) => 'Emoji');

class SidePane extends ConsumerWidget {
  const SidePane({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(selectedModeProvider);
    final hotkeyState = ref.watch(hotkeyProvider);

    registerModeMgmtHotkeys(ref);

    return Container(
      width: 200,
      color: Colors.grey[200],
      child: Column(
        children: [
          for (var modeData in modes)
            _buildModeTile(
              ref,
              modeData.mode,
              selectedMode,
              isHotkeyActive(hotkeyState, modeChangeModifier)
                  ? modeData.hotkeyIcon
                  : modeData.normalIcon,
            ),
          const SizedBox(height: 10),
          Text('Keys: ${hotkeyState.map((key) => key.keyLabel).join(', ')}'),
        ],
      ),
    );
  }

  Widget _buildModeTile(
    WidgetRef ref,
    String mode,
    String selectedMode,
    IconData icon,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(mode),
      selected: mode == selectedMode,
      onTap: () => ref.read(selectedModeProvider.notifier).state = mode,
    );
  }
}

void registerModeMgmtHotkeys(WidgetRef ref) async {
  final container = ProviderContainer();
  final hotkeyNotifier = container.read(hotkeyProvider.notifier);
  for (var modeData in modes) {
    hotkeyNotifier.registerHotkey({
      for (var key in modeChangeModifier) key,
      modeData.hotkey,
    }, () => ref.read(selectedModeProvider.notifier).state = modeData.mode);
  }
}
