
import 'package:braciera_app/core/base_colors.dart';
import 'package:braciera_app/core/base_fonts.dart';
import 'package:braciera_app/core/base_images.dart';
import 'package:braciera_app/core/base_services.dart';
import 'package:braciera_app/core/base_texts.dart';
import 'package:pizza_on/app/core/app_colors.dart';
import 'package:pizza_on/app/core/app_fonts.dart';
import 'package:pizza_on/app/core/app_images.dart';
import 'package:pizza_on/app/core/app_services.dart';
import 'package:pizza_on/app/core/app_texts.dart';
import 'package:pizza_on/features.dart';

class AppBracieraTheme implements AppTheme {
  @override
  AppColors get colors => AppBracieraColors();

  @override
  AppFonts get fonts => AppBracieraFonts();

  @override
  AppImages get images => AppBracieraImages();

  @override
  AppServices get services => AppBracieraServices();

  @override
  AppTexts get texts => AppBracieraTexts();
}