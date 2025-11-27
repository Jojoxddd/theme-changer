import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Enum untuk pilihan font
enum CustomFonts { ABeeZee, Charm }

// Class untuk style text aplikasi
class AppTextStyles {
  final String fontFamily;

  AppTextStyles({required this.fontFamily});

  TextStyle get defaultTextStyle => TextStyle(fontFamily: fontFamily);
}

// Fungsi helper untuk mendapatkan nama string dari Enum
String getFontName(CustomFonts font) {
  switch (font) {
    case CustomFonts.ABeeZee:
      return 'ABeeZee';
    case CustomFonts.Charm:
      return 'Charm';
  }
}

// 1. StateProvider: Menyimpan state font yang dipilih (bisa diubah)
final fontProvider = StateProvider<CustomFonts>((_) => CustomFonts.ABeeZee);

// 2. Provider: Mengambil nama font (String) berdasarkan state di atas (read-only)
final fontSelector = Provider<String>((ref) {
  final selectedFont = ref.watch(fontProvider);
  return getFontName(selectedFont);
});