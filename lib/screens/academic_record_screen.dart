import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/screens/academic_score_screen.dart';
import 'package:smis_mobile/widgets/academic_year_widget.dart';
import 'package:smis_mobile/widgets/gpa_piechat_widget.dart';

class AcademicRecordScreen extends StatefulWidget {
  const AcademicRecordScreen({super.key});

  @override
  State<AcademicRecordScreen> createState() => _AcademicRecordScreenState();
}

class _AcademicRecordScreenState extends State<AcademicRecordScreen> {
  final double gpa = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: AppColors.background,
      //   elevation: 0,
      //   title: Image.asset(
      //     "${AppConstants.imagesPath}Rupp_logo.png",
      //     fit: BoxFit.cover,
      //     height: 35,
      //   ),
      //   actions: [
      //     Row(
      //       children: [
      //         Image.asset(
      //           "${AppConstants.iconsPath}feedback.png",
      //           width: 30,
      //           height: 30,
      //           color: AppColors.textPrimary,
      //           fit: BoxFit.cover,
      //           filterQuality: FilterQuality.high,
      //         ),
      //         const SizedBox(width: 8),
      //         Stack(
      //           children: [
      //             SizedBox(
      //               width: 32,
      //               child: Image.asset(
      //                 "${AppConstants.iconsPath}notification.png",
      //                 width: 30,
      //                 height: 30,
      //                 fit: BoxFit.cover,
      //                 filterQuality: FilterQuality.high,
      //               ),
      //             ),
      //             Positioned(
      //               right: 0,
      //               top: 2,
      //               child: Container(
      //                 width: 18,
      //                 height: 18,
      //                 decoration: BoxDecoration(
      //                   color: Colors.red,
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 child: const Center(
      //                   child: Text(
      //                     '99+',
      //                     textAlign: TextAlign.center,
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 7,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         const SizedBox(width: 15),
      //       ],
      //     ),
      //   ],
      // ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.background,
              elevation: 1,

              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              title: Text(
                "Academic Record",
                style: AppTextStyles.heading,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              centerTitle: true,
            ),

            // 🔥 Divider under AppBar
            const Divider(
              color: Color.fromARGB(255, 214, 213, 213),
              thickness: 2,
              height: 0,
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          // const ContentTitleWidget(title: "Academic Record"),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMedium,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // GPA Section
                    const Text(
                      "GPA",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GpaPiechatWidget(gpa: 3.50),
                    const SizedBox(height: 30),

                    // Academic Year Section
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Academic Years",
                        style: TextStyle(
                          fontSize: AppSizes.textLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 100 / 100, // width / height
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        AcademicYearWidget(
                          year: 1,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AcademicScoreScreen(
                                  year: 1,
                                  stuid: "00001234",
                                ),
                              ),
                            );
                          },
                        ),
                        AcademicYearWidget(
                          year: 2,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AcademicScoreScreen(
                                  year: 2,
                                  stuid: "00001234",
                                ),
                              ),
                            );
                          },
                        ),
                        AcademicYearWidget(year: 3, onTap: () {}),
                        AcademicYearWidget(year: 4, onTap: () {}),
                      ],
                    ),
                    SizedBox(height: AppSizes.paddingMedium),
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
