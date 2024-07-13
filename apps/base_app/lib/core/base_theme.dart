import 'package:base_app/core/base_colors.dart';
import 'package:base_app/core/base_fonts.dart';
import 'package:base_app/core/base_images.dart';
import 'package:base_app/core/base_services.dart';
import 'package:base_app/core/base_texts.dart';
import 'package:pizza_on/app/core/app_colors.dart';
import 'package:pizza_on/app/core/app_fonts.dart';
import 'package:pizza_on/app/core/app_images.dart';
import 'package:pizza_on/app/core/app_services.dart';
import 'package:pizza_on/app/core/app_texts.dart';
import 'package:pizza_on/features.dart';

class AppBaseTheme implements AppTheme {
  @override
  AppColors get colors => AppBaseColors();

  @override
  AppFonts get fonts => AppBaseFonts();

  @override
  AppImages get images => AppBaseImages();

  @override
  AppServices get services => AppBaseServices();

  @override
  AppTexts get texts => AppBaseTexts();
}