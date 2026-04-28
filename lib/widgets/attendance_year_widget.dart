import 'package:flutter/material.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class AttendanceYearWidget extends StatelessWidget {
  final int year;
  final VoidCallback onTap;
  const AttendanceYearWidget({
    super.key,
    required this.year,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Icon(Icons.school, color: Colors.white, size: 36),
              Image.asset(
                "${AppConstants.iconsPath}attendance.png",
                width: 30,
                height: 30,
                filterQuality: FilterQuality.high,
              ),
              // const SizedBox(height: 5),
              Text(
                "Year $year",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppSizes.textMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
