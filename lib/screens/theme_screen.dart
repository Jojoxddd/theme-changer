import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_changer/providers/theme_provider.dart';

class ThemeScreen extends ConsumerWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Baca status tema saat ini
    final currentTheme = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select App Theme:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          
          // Pilihan Theme A
          ListTile(
            title: const Text("Theme A (Red)"),
            leading: Radio<AppTheme>(
              value: AppTheme.themeA,
              groupValue: currentTheme,
              onChanged: (value) {
                ref.read(themeProvider.notifier).state = value!;
              },
            ),
          ),
          
          // Pilihan Theme B
          ListTile(
            title: const Text("Theme B (Green)"),
            leading: Radio<AppTheme>(
              value: AppTheme.themeB,
              groupValue: currentTheme,
              onChanged: (value) {
                ref.read(themeProvider.notifier).state = value!;
              },
            ),
          ),
          
          // Pilihan Theme C
          ListTile(
            title: const Text("Theme C (Blue)"),
            leading: Radio<AppTheme>(
              value: AppTheme.themeC,
              groupValue: currentTheme,
              onChanged: (value) {
                ref.read(themeProvider.notifier).state = value!;
              },
            ),
          ),
        ],
      ),
    );
  }
}