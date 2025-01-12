import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF1565C0);
  static const Color accentColor = Color(0xFF64B5F6);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color textColor = Color(0xFF333333);
  static const Color lightTextColor = Color(0xFF757575);
}

class AppStyles {
  static TextStyle headerText = GoogleFonts.poppins(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle subHeaderText = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 16,
    color: AppColors.textColor,
  );
}
