import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_changer/providers/font_provider.dart';

class FontScreen extends ConsumerStatefulWidget {
  const FontScreen({super.key});

  @override
  ConsumerState<FontScreen> createState() => _FontScreenState();
}

class _FontScreenState extends ConsumerState<FontScreen> {
  @override
  Widget build(BuildContext context) {
    // Mengambil nilai font saat ini untuk text style preview
    final font = ref.watch(fontSelector);
    final textStyles = AppTextStyles(fontFamily: font);
    
    // Mengambil nilai enum font untuk radio button group value
    final selectedFontState = ref.watch(fontProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select a font below:',
            style: textStyles.defaultTextStyle,
          ),
          const SizedBox(height: 20),
          
          // Radio Group Logic
          Column(
            children: [
              ListTile(
                title: const Text(
                  'ABeeZee',
                  style: TextStyle(fontFamily: 'ABeeZee', fontSize: 16),
                ),
                leading: Radio<CustomFonts>(
                  value: CustomFonts.ABeeZee,
                  groupValue: selectedFontState,
                  onChanged: (value) {
                    // Mengupdate state di provider
                    ref.read(fontProvider.notifier).state = value!;
                  },
                ),
              ),
              ListTile(
                title: const Text(
                  'Charm',
                  style: TextStyle(fontFamily: 'Charm', fontSize: 16),
                ),
                leading: Radio<CustomFonts>(
                  value: CustomFonts.Charm,
                  groupValue: selectedFontState,
                  onChanged: (value) {
                    // Mengupdate state di provider
                    ref.read(fontProvider.notifier).state = value!;
                  },
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 30),
          Text(
            'This is a preview of the selected font. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: textStyles.defaultTextStyle.copyWith(fontSize: 16),
          ),
        ],
      ),
    );
  }
}