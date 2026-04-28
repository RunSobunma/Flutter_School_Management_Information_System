import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class SettingBtnWidget extends StatelessWidget {
  final String iconImage;
  final String tilte;
  final VoidCallback onTap;
  const SettingBtnWidget({
    super.key,
    required this.iconImage,
    required this.tilte,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppSizes.radiusCircular),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 8.5, bottom: 8.5),
              child: Row(
                children: [
                  Image.asset(
                    iconImage,
                    color: Colors.white,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),
                  Text(
                    tilte,
                    style: TextStyle(fontSize: 12, color: AppColors.textWhite),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
