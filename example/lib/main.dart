import 'package:example/constants.dart';
import 'package:example/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iconsax Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Constants.seedColor,
        ),
        fontFamily: GoogleFonts.lato().fontFamily,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
