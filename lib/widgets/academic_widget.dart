import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class AcademicWidget extends StatelessWidget {
  const AcademicWidget({
    super.key,
    required this.title,
    required this.child,
    required this.onTap,
  });

  final String title;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Local responsive sizes
    double childWidth = 35;
    double childHeight = 30;
    double textSize = 9;
    double heightSpace = 5;

    // Tablet / iPad responsive layout
    if (MediaQuery.of(context).size.width >= 600) {
      childWidth = 40;
      childHeight = 35;
      textSize = 12;
      heightSpace = 10;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        ),
        child: Center(
          child: SizedBox(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: childWidth, height: childHeight, child: child),
                SizedBox(height: heightSpace),
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: textSize,
                        color: AppColors.textWhite,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
