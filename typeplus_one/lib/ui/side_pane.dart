import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:typeplus_one/state/hotkey.dart';
import 'package:typeplus_one/search/modes.dart';

final selectedModeProvider = StateProvider<String>((ref) => 'Emoji');

// prevent hotkey registration from being called multiple times (NOTE: make sure to understand what is going on)
final hotkeyRegistrationProvider = Provider.autoDispose((ref) {
  registerModeMgmtHotkeys(ref);
  return; // You can return any value here, or null
});

class SidePane extends ConsumerWidget {
  const SidePane({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(selectedModeProvider);
    final hotkeyState = ref.watch(hotkeyProvider);

    // Trigger hotkey registration only once
    ref.watch(hotkeyRegistrationProvider);

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

void registerModeMgmtHotkeys(dynamic ref) {
  final container = ProviderContainer();
  final hotkeyNotifier = container.read(hotkeyProvider.notifier);
  for (var modeData in modes) {
    hotkeyNotifier.registerHotkey({
      for (var key in modeChangeModifier) key,
      modeData.hotkey,
    }, () => ref.read(selectedModeProvider.notifier).state = modeData.mode);
  }
}
