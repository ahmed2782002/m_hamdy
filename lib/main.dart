import 'package:flutter/material.dart';

import 'portfolio_page.dart';

void main() => runApp(const MahmoudPortfolio());

class MahmoudPortfolio extends StatefulWidget {
  const MahmoudPortfolio({super.key});

  @override
  State<MahmoudPortfolio> createState() => _MahmoudPortfolioState();
}

class _MahmoudPortfolioState extends State<MahmoudPortfolio> {
  bool _lightMode = true;

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Mahmoud Hamdy | Content Creator',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xFFF7F5FB),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFEC6A26),
        surface: Color(0xFFF7F5FB),
        onSurface: Color(0xFF211B31),
      ),
      textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'IBMPlexSansArabic',
        bodyColor: const Color(0xFF211B31),
        displayColor: const Color(0xFF211B31),
      ),
    ),
    darkTheme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF0D0E20),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF8A3D),
        surface: Color(0xFF0D0E20),
        onSurface: Colors.white,
      ),
      textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'IBMPlexSansArabic',
      ),
    ),
    themeMode: _lightMode ? ThemeMode.light : ThemeMode.dark,
    home: PortfolioPage(
      isLight: _lightMode,
      onThemeToggle: () => setState(() => _lightMode = !_lightMode),
    ),
  );
}
