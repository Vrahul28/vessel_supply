import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vessel_supply/res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vessel Supply',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(context.textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F5F97),
        ),
        useMaterial3: true,
      ),
      getPages: Routes.appRoutes(),
    );
  }
}
