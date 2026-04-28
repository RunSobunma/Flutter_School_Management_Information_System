import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_fonts.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
  );
  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  // ignore: constant_identifier_names
  static const TextStyle button_outline = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
