
import 'package:flutter/material.dart';
import 'package:pizza_on/app/core/app_colors.dart';

class AppColorBraciera implements AppColors {
  @override
  Color get backgroundColor => Color.fromARGB(255, 206, 206, 206);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get buttonColor => Color.fromARGB(255, 22, 151, 28);

  @override
  Color get grey => const Color(0xFF313131);

  @override
  Color get grey300 => const Color(0xFF4D4D4D);

  @override
  Color get grey340 => const Color(0xFF4A4A4A);

  @override
  Color get grey600 => const Color(0xFF262626);

  @override
  Color get lightGrey => const Color(0xFF4A4A4A);

  @override
  Color get red => const Color(0xFFFF2000);

  @override
  Color get textColor => Color.fromARGB(255, 224, 224, 224);

  @override
  Color get white => const Color(0xFFFFFFFF);
}
