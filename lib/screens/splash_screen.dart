import 'package:flutter/material.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primary,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 150),
            height: 400,
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    "${AppConstants.imagesPath}Rupp_logo.png",
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "S.M.I.S",
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(height: 30, width: 1, color: AppColors.textWhite),
                    Text(
                      "C.S.D",
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
