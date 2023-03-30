import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_dio_flutter/pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, textTheme: GoogleFonts.robotoTextTheme()),
      home: const LoginPage(),
    );
  }
}