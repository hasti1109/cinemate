import 'package:flutter/material.dart';


ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade50,
      primary: const Color(0xFFE7D9F6),
      secondary: const Color(0xFFD9C9EC),
      tertiary: const Color(0xFFC6B1DF),
      inversePrimary: const Color(0xFF756AB6),
    )
);

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
          background: Colors.grey.shade800,
          primary: Colors.grey.shade700,
          secondary: Colors.grey.shade600,
          tertiary: Colors.grey.shade500,
          inversePrimary: const Color(0xFFE7D9F6),
    )
);