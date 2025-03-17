import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:typeplus_one/ui/side_pane.dart';
import 'package:typeplus_one/ui/search_bar.dart';
import 'package:typeplus_one/state/hotkey.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          const SidePane(), // TODO: fix
          Expanded(
            child: Column(
              children: [
                const SearchBarWidget(),
                Padding(padding: const EdgeInsets.all(8.0), child: Text('')),
                const Expanded(child: Placeholder()), // Main content area
              ],
            ),
          ),
        ],
      ),
    );
  }
}
