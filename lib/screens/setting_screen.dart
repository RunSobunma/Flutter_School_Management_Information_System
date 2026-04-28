import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:smis_mobile/controllers/auth_controller.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/widgets/conten_title_widget.dart';
import 'package:smis_mobile/widgets/setting_btn_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Image.asset(
          "${AppConstants.imagesPath}Rupp_logo.png",
          fit: BoxFit.cover,
          height: 35,
        ),
        actions: [
          Row(
            children: [
              Image.asset(
                "${AppConstants.iconsPath}feedback.png",
                width: 30,
                height: 30,
                // colorBlendMode: BlendMode.clear,
                color: Colors.white,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
              const SizedBox(width: 8),
              Stack(
                children: [
                  SizedBox(
                    width: 32,
                    child: Image.asset(
                      "${AppConstants.iconsPath}notification.png",
                      color: Colors.white,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 2,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          '99+',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 15),
            ],
          ),
        ],
      ),

      //body
      body: Column(
        children: [
          ContentTitleWidget(title: "Setting", color: AppColors.textWhite),
          SizedBox(height: 20),
          CircleAvatar(
            radius: 52,
            backgroundColor: AppColors.background,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: Image(
                image: AssetImage("assets/images/profile.jpg"),
                fit: BoxFit.cover,
              ).image,
            ),
          ),
          Text(
            "Run Sobunma",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textWhite,
            ),
          ),
          Text(
            "ID: 012345678",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textWhite,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppSizes.radiusLarge),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.paddingMedium),
                child: Column(
                  children: [
                    // profile btn
                    SettingBtnWidget(
                      iconImage: "${AppConstants.iconsPath}profile.png",
                      tilte: "My Profile",
                      onTap: () {
                        Get.toNamed('/profile-screen');
                      },
                    ),
                    // logoout btn
                    SettingBtnWidget(
                      iconImage: "${AppConstants.iconsPath}logout.png",
                      tilte: "Logout",
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Obx(
                            () => auth.loading.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        AppSizes.radiusMedium,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.all(20),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: const Text(
                                            "Do you want to logout?",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.primary,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 8,
                                                    ),
                                              ),
                                              onPressed: () {
                                                auth.signout();
                                              },
                                              child: const Text(
                                                "Yes, Logout",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),

                    Spacer(),
                    // app version and title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "App Version: ${AppConstants.appVersion}",
                          style: TextStyle(
                            fontSize: AppSizes.textSmall,
                            fontWeight: FontWeight.w300,
                            color: AppColors.textDarkGrey,
                            height: 0,
                          ),
                        ),
                        Text(
                          AppConstants.appTitle,
                          style: TextStyle(
                            fontSize: AppSizes.textSmall,
                            fontWeight: FontWeight.w300,
                            color: AppColors.textDarkGrey,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
