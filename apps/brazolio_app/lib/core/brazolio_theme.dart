
import 'package:brazolio_app/core/brazolio_colors.dart';
import 'package:brazolio_app/core/brazolio_fonts.dart';
import 'package:brazolio_app/core/brazolio_images.dart';
import 'package:brazolio_app/core/brazolio_services.dart';
import 'package:brazolio_app/core/brazolio_texts.dart';
import 'package:pizza_on/app/core/app_colors.dart';
import 'package:pizza_on/app/core/app_fonts.dart';
import 'package:pizza_on/app/core/app_images.dart';
import 'package:pizza_on/app/core/app_services.dart';
import 'package:pizza_on/app/core/app_texts.dart';
import 'package:pizza_on/features.dart';

class AppBrazolioTheme implements AppTheme {
  @override
  AppColors get colors => AppBrazolioColors();

  @override
  AppFonts get fonts => AppBrazolioFonts();

  @override
  AppImages get images => AppBrazolioImages();

  @override
  AppServices get services => AppBrazolioServices();

  @override
  AppTexts get texts => AppBrazolioTexts();
}