import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/screens/feedback_screen.dart';
import 'package:smis_mobile/screens/news_screen.dart';
import 'package:smis_mobile/screens/notification_screen.dart';
import 'package:smis_mobile/widgets/academic_widget.dart';
import 'package:smis_mobile/widgets/button_widget.dart';
import 'package:smis_mobile/widgets/slide_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      // appBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              "${AppConstants.imagesPath}Rupp_logo.png",
              fit: BoxFit.cover,
              height: 35,
            ),
            SizedBox(width: 10),
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "WELCOME TO SMIS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  // Navigate to feedback screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackScreen()),
                  );
                },
                child: Image.asset(
                  "${AppConstants.iconsPath}feedback.png",
                  width: 30,
                  // height: 30,
                  // colorBlendMode: BlendMode.clear,
                  color: Colors.white,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  // Navigate to notification screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    SizedBox(
                      width: 30,
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
              ),
              const SizedBox(width: 15),
            ],
          ),
        ],
      ),

      // body
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 110,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,

                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.radiusLarge),
                    topRight: Radius.circular(AppSizes.radiusLarge),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingMedium,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 50),

                        // session Academics
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 25),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    "Academics",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio:
                                            107 / 90, // width / height
                                      ),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    //btn my class
                                    AcademicWidget(
                                      title: "My Class",
                                      child: Image.asset(
                                        "${AppConstants.iconsPath}myclass.png",
                                      ),
                                      onTap: () {
                                        Get.toNamed('/my-class-screen');
                                      },
                                    ),

                                    //btn academic record
                                    AcademicWidget(
                                      title: "Academic record",
                                      child: Image.asset(
                                        "${AppConstants.iconsPath}academic_record.png",
                                      ),
                                      onTap: () {
                                        Get.toNamed('/academic-record-screen');
                                      },
                                    ),

                                    // btn attendance
                                    AcademicWidget(
                                      title: "Attendance",
                                      child: Image.asset(
                                        "${AppConstants.iconsPath}attendance.png",
                                        color: Colors.white,
                                        fit: BoxFit.cover,
                                      ),
                                      onTap: () {
                                        Get.toNamed('/attendance-screen');
                                      },
                                    ),

                                    // btn news
                                    AcademicWidget(
                                      title: "News",
                                      child: Image.asset(
                                        "${AppConstants.iconsPath}news.png",
                                      ),
                                      onTap: () {
                                        Get.toNamed('/news-screen');
                                      },
                                    ),

                                    // btn school holidays
                                    AcademicWidget(
                                      title: "School Holidays",
                                      child: Image.asset(
                                        "${AppConstants.iconsPath}school-holiday.png",
                                      ),
                                      onTap: () {
                                        Get.toNamed('/school-holiday-screen');
                                      },
                                    ),

                                    // btn about us
                                    AcademicWidget(
                                      title: "About us",
                                      child: Image.asset(
                                        "${AppConstants.iconsPath}about.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                      onTap: () {
                                        Get.toNamed('/about-us-screen');
                                      },
                                    ),
                                  ],
                                ),

                                // session news & events / Scholaship
                                SizedBox(height: 15),
                                SlideWidget(
                                  title: "News & Events",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewsScreen(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 15),
                                SlideWidget(
                                  title: "Scolaship",
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewsScreen(
                                          category: "Scholarships",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //profile
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMedium,
                ),
                child: SizedBox(
                  width: 320,
                  height: 200,
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 145,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(
                              AppSizes.radiusMedium,
                            ),
                            border: Border.all(color: Colors.black12, width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Run Sobunma",
                                style: TextStyle(
                                  fontSize: AppSizes.textLarge,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textDarkGrey,
                                ),
                              ),

                              Text(
                                "run.sobunma.1222@rupp.edu.kh",
                                style: TextStyle(
                                  fontSize: AppSizes.textSmall,
                                  color: AppColors.textDarkGrey,
                                ),
                              ),
                              Text(
                                "+855 99999999",
                                style: TextStyle(
                                  fontSize: AppSizes.textSmall,
                                  color: AppColors.textDarkGrey,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // btn setting
                                  ButtonWidget(
                                    onPressed: () {
                                      Get.toNamed('/setting-screen');
                                    },
                                    width: 110,
                                    height: 30,
                                    isOutlined: true,
                                    backgroundColor: AppColors.secondary,
                                    textColor: Colors.black,
                                    child: Text(
                                      "Setting",
                                      style: AppTextStyles.button_outline,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.school,
                                            size: 23,
                                            color: AppColors.secondary,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Student",
                                            style: TextStyle(
                                              fontSize: AppSizes.textMedium,
                                              color: AppColors.textDarkGrey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          // Icon(
                                          //   Icons.contact_emergency_outlined,
                                          //   size: 15,
                                          //   color: Colors.grey,
                                          // ),
                                          SizedBox(width: 5),
                                          Text(
                                            "ID: 123456789",
                                            style: TextStyle(
                                              fontSize: AppSizes.textMedium,
                                              color: AppColors.textDarkGrey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 25,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: Image(
                              image: AssetImage("assets/images/profile.jpg"),
                              fit: BoxFit.cover,
                            ).image,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
