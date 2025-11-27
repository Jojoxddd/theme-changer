import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_changer/providers/theme_provider.dart'; // Import provider baru
import 'package:theme_changer/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// Ubah menjadi ConsumerWidget agar bisa memantau themeProvider
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Pantau perubahan tema
    final currentTheme = ref.watch(themeProvider);
    // Ambil warna sesuai tema yang dipilih
    final themeColor = getThemeColor(currentTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Gunakan warna dari provider sebagai seedColor [cite: 383]
        colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
        useMaterial3: true,
        // Ubah warna AppBar agar terlihat jelas perubahannya
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}