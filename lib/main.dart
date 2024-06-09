import 'package:courseinsights/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme:
            GoogleFonts.ibmPlexSansTextTheme(Theme.of(context).textTheme),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 32, 35, 39),
        textTheme:
            GoogleFonts.ibmPlexSansTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const SignupScreen(),
    );
  }
}
