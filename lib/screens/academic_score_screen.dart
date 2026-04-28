import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/widgets/table_scrore_widet.dart';

class AcademicScoreScreen extends StatefulWidget {
  final int year;
  final String stuid;

  const AcademicScoreScreen({
    super.key,
    required this.year,
    required this.stuid,
  });

  @override
  State<AcademicScoreScreen> createState() => _AcademicScoreScreenState();
}

class _AcademicScoreScreenState extends State<AcademicScoreScreen> {
  final Map<String, dynamic> data = {
    "class": "A4",
    "score_sem1": {
      "Window": {
        "Attend": 10.00,
        "Assign": 10.20,
        "Midterm": 20.39,
        "Final": 59.50,
      },
      "SE and IT PM": {
        "Attend": 10.30,
        "Assign": 10.40,
        "Midterm": 20.99,
        "Final": 50.99,
      },
      "Networking": {
        "Attend": 9.99,
        "Assign": 10.99,
        "Midterm": 18.99,
        "Final": 55.99,
      },
      "Mobile App": {
        "Attend": 10.99,
        "Assign": 10.88,
        "Midterm": 20.99,
        "Final": 60,
      },
      "OOAD and Prog": {
        "Attend": 10.99,
        "Assign": 10.99,
        "Midterm": 20.88,
        "Final": 50.88,
      },
      "M.I.S": {
        "Attend": 9.99,
        "Assign": 9.99,
        "Midterm": 18.99,
        "Final": 37.99,
      },
    },
    "score_sem2": {
      "Window": {
        "Attend": 8.00,
        "Assign": 10.20,
        "Midterm": 20.39,
        "Final": 59.50,
      },
      "SE and IT PM": {
        "Attend": 10.30,
        "Assign": 10.40,
        "Midterm": 20.99,
        "Final": 50.99,
      },
      "Networking": {
        "Attend": 9.99,
        "Assign": 10.99,
        "Midterm": 18.99,
        "Final": 55.99,
      },
      "Mobile App": {
        "Attend": 10.99,
        "Assign": 10.88,
        "Midterm": 20.99,
        "Final": 60,
      },
      "OOAD and Prog": {
        "Attend": 10.99,
        "Assign": 10.99,
        "Midterm": 20.88,
        "Final": 50.88,
      },
      "M.I.S": {
        "Attend": 9.99,
        "Assign": 9.99,
        "Midterm": 18.99,
        "Final": 37.99,
      },
    },
  };

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
              elevation: 0,

              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              title: Text(
                "Academic Year ${widget.year}",
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

      // BODY
      body: Column(
        children: [
          // title
          // ContentTitleWidget(title: "Year ${widget.year}"),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "ID: ${widget.stuid}",
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Class: ${data['class']}",
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Semester 1 Table
                  TableScoreWidget(
                    title: "Score Semester 1",
                    semesterData: data["score_sem1"],
                  ),

                  // Semester 2 Table
                  TableScoreWidget(
                    title: "Score Semester 2",
                    semesterData: data["score_sem2"],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
