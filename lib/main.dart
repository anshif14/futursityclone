import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:futursityclone/features/home/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

var height;
var width;


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
