import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';

class ContentTitleWidget extends StatelessWidget {
  final String title;
  final Color? color;

  const ContentTitleWidget({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: color ?? AppColors.textPrimary,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color ?? AppColors.textPrimary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(width: 48), // Balance spacing with the IconButton width
      ],
    );
  }
}
