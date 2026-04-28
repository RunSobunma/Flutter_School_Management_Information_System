import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class TextFieldTwoWidget extends StatelessWidget {
  const TextFieldTwoWidget({
    super.key,
    required this.hintText_1,
    required this.valueController_1,
    this.keyboardType_1 = TextInputType.text,
    this.obscureText_1 = false,
    required this.hintText_2,
    required this.valueController_2,
    this.keyboardType_2 = TextInputType.text,
    this.obscureText_2 = false,
  });

  final String hintText_1;
  final TextEditingController valueController_1;
  final TextInputType? keyboardType_1;
  final bool obscureText_1;

  final String hintText_2;
  final TextEditingController valueController_2;
  final TextInputType? keyboardType_2;
  final bool obscureText_2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        border: Border.all(color: AppColors.textSecondary, width: 1.2),
      ),
      child: Column(
        children: [
          //txt 1
          Expanded(
            child: Center(
              child: TextField(
                keyboardType: keyboardType_1,
                obscureText: obscureText_1,
                controller: valueController_1,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: AppSizes.textLarge,
                  color: AppColors.textDarkGrey,
                ),
                decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  hintText: hintText_1,
                  hintStyle: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.textMedium,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),

          Divider(color: AppColors.textSecondary, thickness: 1, height: 0),

          // txt 2
          Expanded(
            child: Center(
              child: TextField(
                keyboardType: keyboardType_2,
                obscureText: obscureText_2,
                controller: valueController_2,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: AppSizes.textLarge,
                  color: AppColors.textDarkGrey,
                ),
                decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                  hintText: hintText_2,
                  hintStyle: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: AppSizes.textMedium,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
