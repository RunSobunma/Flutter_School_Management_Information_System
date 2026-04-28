import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/widgets/holiday_widget.dart';

class SchoolHolidaysScreen extends StatefulWidget {
  const SchoolHolidaysScreen({super.key});

  @override
  State<SchoolHolidaysScreen> createState() => _SchoolHolidaysScreenState();
}

class _SchoolHolidaysScreenState extends State<SchoolHolidaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "School Holidays",
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

      // Body
      body: Column(
        children: [
          // const ContentTitleWidget(title: "School Holidays"),
          Expanded(
            child: Padding(
              // padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingMedium),
              padding: EdgeInsetsGeometry.only(
                top: AppSizes.paddingMedium,
                left: AppSizes.paddingMedium,
                right: AppSizes.paddingMedium,
              ),

              //content
              child: HolidayWidget(year: 2026),
            ),
          ),
        ],
      ),
    );
  }
}
