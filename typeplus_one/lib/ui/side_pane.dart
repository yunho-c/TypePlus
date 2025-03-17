import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedModeProvider = StateProvider<String>((ref) => 'File Search');

class SidePane extends ConsumerWidget {
  const SidePane({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMode = ref.watch(selectedModeProvider);

    return Container(
      width: 200,
      color: Colors.grey[200],
      child: Column(
        children: [
          _buildModeTile(ref, 'File Search', selectedMode),
          _buildModeTile(ref, 'Folder Search', selectedMode),
          _buildModeTile(ref, 'Text Search', selectedMode),
        ],
      ),
    );
  }

  Widget _buildModeTile(WidgetRef ref, String mode, String selectedMode) {
    return ListTile(
      title: Text(mode),
      selected: mode == selectedMode,
      onTap: () => ref.read(selectedModeProvider.notifier).state = mode,
    );
  }
}
