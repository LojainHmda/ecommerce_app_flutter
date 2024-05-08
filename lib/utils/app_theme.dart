import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.Primary),
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide.none,),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide.none,),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide.none,),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide.none,),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:  BorderSide.none,),
        filled: true,
        
        fillColor: AppColors.grey3,
      ),
    );
  }
}
