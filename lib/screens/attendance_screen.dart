import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/screens/attendance_year_screen.dart';
import 'package:smis_mobile/widgets/attendances_widget.dart';
import 'package:smis_mobile/widgets/attendance_year_widget.dart';


class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // ✅ Sample attendance data
  final List<Map<String, dynamic>> data = [
    {"status": 1, "date": "Mon, Oct 07 at 08:30AM"},
    {"status": 2, "date": "Tue, Oct 08 at 08:30AM"},
    {"status": 3, "date": "Wed, Oct 09 at 08:30AM"},
    {"status": 4, "date": "Thu, Oct 10 at 08:30AM"},
    {"status": 2, "date": "Fri, Oct 11 at 08:30AM"},
    {"status": 1, "date": "Sat, Oct 12 at 08:30AM"},
    {"status": 1, "date": "Mon, Oct 07 at 08:30AM"},
    {"status": 2, "date": "Tue, Oct 08 at 08:30AM"},
    {"status": 3, "date": "Wed, Oct 09 at 08:30AM"},
    {"status": 4, "date": "Thu, Oct 10 at 08:30AM"},
    {"status": 2, "date": "Fri, Oct 11 at 08:30AM"},
    {"status": 1, "date": "Sat, Oct 12 at 08:30AM"},
  ];

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
                "Attendance",
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

      //body
      body: Column(
        children: [
          // const ContentTitleWidget(title: "Attendance"),
          Expanded(
            child: Padding(
              // padding: const EdgeInsets.symmetric(
              //   horizontal: AppSizes.paddingMedium,
              // ),
              padding: EdgeInsets.only(
                top: AppSizes.paddingMedium,
                left: AppSizes.paddingMedium,
                right: AppSizes.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Year selector
                  GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 100 / 50,
                        ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      AttendanceYearWidget(
                        year: 1,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AttendanceYearScreen(year: 1),
                            ),
                          );
                        },
                      ),
                      AttendanceYearWidget(
                        year: 2,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AttendanceYearScreen(year: 2),
                            ),
                          );
                        },
                      ),
                      AttendanceYearWidget(
                        year: 3,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AttendanceYearScreen(year: 3),
                            ),
                          );
                        },
                      ),
                      AttendanceYearWidget(
                        year: 4,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AttendanceYearScreen(year: 4),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ✅ Section title
                  const Text(
                    "Currently Attendance for a Week",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  // ✅ Attendance list (call your widget)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AttendanceWidget(data: data),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
