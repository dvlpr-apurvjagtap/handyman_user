import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    // App Bar Theme
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.scaffoldBackgroundColor),
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyle(
            color: AppColors.scaffoldBackgroundColor,
            fontFamily: Typo.medium,
            fontSize: 18.sp)),

    // Scaffold
    scaffoldBackgroundColor: Color(0xffffffff),
    // Filled Button
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: TextStyle(fontFamily: Typo.semiBold, fontSize: 16.sp),
        minimumSize: Size(double.infinity, 45.h),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
          fontFamily: Typo.medium, fontSize: 14.sp, color: AppColors.body),
      filled: true,
      fillColor: AppColors.backgroundColor,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0, color: AppColors.backgroundColor),
          borderRadius: BorderRadius.circular(12.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1),
          borderRadius: BorderRadius.circular(12.r)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 10, 3, 3),
    primaryColor: AppColors.primary,
    // App Bar Theme
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.scaffoldBackgroundColor),
        backgroundColor: AppColors.primary,
        titleTextStyle: TextStyle(
            color: AppColors.scaffoldBackgroundColor,
            fontFamily: Typo.medium,
            fontSize: 18.sp)),

    // Scaffold

    // Filled Button
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: TextStyle(fontFamily: Typo.semiBold, fontSize: 16.sp),
        minimumSize: Size(double.infinity, 45.h),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
          fontFamily: Typo.medium, fontSize: 14.sp, color: AppColors.body),
      // filled: true,
      // fillColor: AppColors.backgroundColor,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            // color: AppColors.backgroundColor,
          ),
          borderRadius: BorderRadius.circular(12.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1),
          borderRadius: BorderRadius.circular(12.r)),
    ),
  );
}
