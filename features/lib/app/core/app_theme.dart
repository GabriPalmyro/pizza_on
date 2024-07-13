import 'package:pizza_on/app/core/app_colors.dart';
import 'package:pizza_on/app/core/app_fonts.dart';
import 'package:pizza_on/app/core/app_images.dart';
import 'package:pizza_on/app/core/app_services.dart';
import 'package:pizza_on/app/core/app_texts.dart';

abstract class AppTheme {
  AppFonts get fonts;
  AppColors get colors;
  AppServices get services;
  AppImages get images;
  AppTexts get texts;
}