import 'package:entrance_test/commons/configs/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: textTheme.headlineSmall,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        )
      )
    )
  );

  static TextTheme textTheme = TextTheme(
    //Heading / Heading H2
    displayMedium: GoogleFonts.montserrat(
      fontSize: 24, 
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary
    ),
    //Heading / Heading H4
    headlineLarge: GoogleFonts.montserrat(
      fontSize: 18, 
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary
    ),
    //Heading / Heading H5
    headlineMedium: GoogleFonts.roboto(
      fontSize: 15, 
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimary
    ),
    //Heading / Heading H5
    headlineSmall: GoogleFonts.montserrat(
      fontSize: 14, 
      fontWeight: FontWeight.w500,
      color: AppColors.background
    ),
    //Body / Paragraph
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 14, 
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary
    ),
    //Body / Paragraph Small
    bodySmall: GoogleFonts.montserrat(
      fontSize: 12, 
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary
    ),
  );
}

