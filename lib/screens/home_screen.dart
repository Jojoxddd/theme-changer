import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_changer/providers/font_provider.dart';
import 'package:theme_changer/screens/dashboard_screen.dart';
import 'package:theme_changer/screens/font_screen.dart';
import 'package:theme_changer/screens/theme_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Memantau font agar judul AppBar ikut berubah
    final font = ref.watch(fontSelector);
    final textStyles = AppTextStyles(fontFamily: font);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to App',
          style: textStyles.defaultTextStyle,
        ),
      ),
      body: IndexedStack(
        index: _selectedTabIndex,
        children: const [
          DashboardScreen(),
          ThemeScreen(),
          FontScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_paint),
            label: 'Theme',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.font_download),
            label: 'Font',
          ),
        ],
      ),
    );
  }
}