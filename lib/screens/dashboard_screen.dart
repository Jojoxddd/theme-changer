import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_changer/providers/font_provider.dart';
import 'package:theme_changer/providers/theme_provider.dart'; // Import theme provider

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(fontSelector);
    final textStyles = AppTextStyles(fontFamily: font);
    
    // Pantau tema untuk mengubah gambar [cite: 380]
    final currentTheme = ref.watch(themeProvider);
    final themeColor = getThemeColor(currentTheme);
    final themeIcon = getThemeIcon(currentTheme);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dashboard Screen',
            style: textStyles.defaultTextStyle.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 30),
          
          // Gambar/Ikon yang berubah sesuai tema
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: themeColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: themeColor, width: 4),
            ),
            child: Icon(
              themeIcon, // Ikon berubah sesuai tema (Api/Rumput/Air)
              size: 80,
              color: themeColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            getThemeName(currentTheme),
            style: textStyles.defaultTextStyle.copyWith(
              fontSize: 16, 
              color: themeColor,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}