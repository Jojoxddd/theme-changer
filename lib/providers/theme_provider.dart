import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definisi Enum untuk 3 jenis tema: A, B, dan C [cite: 379]
enum AppTheme { themeA, themeB, themeC }

// StateProvider untuk menyimpan tema yang sedang dipilih (Default: Theme A)
final themeProvider = StateProvider<AppTheme>((ref) => AppTheme.themeA);

// Helper untuk mendapatkan Warna Utama berdasarkan tema [cite: 382]
Color getThemeColor(AppTheme theme) {
  switch (theme) {
    case AppTheme.themeA:
      return Colors.red; // Theme A: Merah
    case AppTheme.themeB:
      return Colors.green; // Theme B: Hijau
    case AppTheme.themeC:
      return Colors.blue; // Theme C: Biru
  }
}

// Helper untuk mendapatkan Judul Tema
String getThemeName(AppTheme theme) {
  switch (theme) {
    case AppTheme.themeA:
      return "Theme A (Red)";
    case AppTheme.themeB:
      return "Theme B (Green)";
    case AppTheme.themeC:
      return "Theme C (Blue)";
  }
}

// Helper untuk mendapatkan Gambar/Icon berdasarkan tema [cite: 380]
// Catatan: Anda bisa mengganti ini dengan path 'assets/gambar.png' jika punya file gambar
IconData getThemeIcon(AppTheme theme) {
  switch (theme) {
    case AppTheme.themeA:
      return Icons.local_fire_department; // Ikon Api untuk Merah
    case AppTheme.themeB:
      return Icons.grass; // Ikon Rumput untuk Hijau
    case AppTheme.themeC:
      return Icons.water_drop; // Ikon Air untuk Biru
  }
}