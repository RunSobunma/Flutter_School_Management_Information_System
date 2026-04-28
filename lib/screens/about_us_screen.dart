import 'package:flutter/material.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: AppColors.background,
      //   elevation: 0,
      //   title: Image.asset(
      //     "${AppConstants.imagesPath}Rupp_logo.png",
      //     height: 35,
      //   ),
      //   actions: [
      //     Row(
      //       children: [
      //         Image.asset(
      //           "${AppConstants.iconsPath}feedback.png",
      //           width: 30,
      //           color: AppColors.textPrimary,
      //         ),
      //         const SizedBox(width: 8),
      //         Stack(
      //           children: [
      //             Image.asset(
      //               "${AppConstants.iconsPath}notification.png",
      //               width: 30,
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

      // appbar
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
              // appBar title
              title: Text(
                "About Us",
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
          // ContentTitleWidget(title: "About Us"),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                // padding: const EdgeInsets.symmetric(
                //   horizontal: AppSizes.paddingMedium,
                // ),
                padding: EdgeInsetsGeometry.only(
                  left: AppSizes.paddingMedium,
                  right: AppSizes.paddingMedium,
                  top: AppSizes.paddingMedium,
                ),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 300 / 150,
                      child: SizedBox(
                        width: 300,
                        child: Image.asset(
                          "${AppConstants.imagesPath}labLogo.png",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Text(
                    //   "software and Application Inovation Research Lab",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    ProfileWidget(
                      image: "${AppConstants.devImagesPath}instructor.jpg",
                      name: "Dr. Heng Sovannarith",
                      position: "Instructor",
                    ),
                    ProfileWidget(
                      image: "${AppConstants.devImagesPath}pro_mananger.jpg",
                      name: "Mr. Heng Kakada",
                      position: "Assistant & Project Manager",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileWidget(
                          image: "${AppConstants.devImagesPath}dev1.jpg",
                          name: "Mr. Run Sobunma",
                          position: "Developer",
                        ),
                        ProfileWidget(
                          image: "${AppConstants.devImagesPath}uxui1.jpg",
                          name: "Ms. Vuth Sophea",
                          position: "UX/UI Designer",
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileWidget(
                          image: "${AppConstants.devImagesPath}dev2.jpg",
                          name: "Ms. Lung Sreypich",
                          position: "UX/UI Designer",
                        ),
                        ProfileWidget(
                          image: "${AppConstants.devImagesPath}uxui2.jpg",
                          name: "Ms. Vanna Raksa",
                          position: "UX/UI Designer",
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

// Profile Widget
class ProfileWidget extends StatelessWidget {
  final String image;
  final String name;
  final String position;
  const ProfileWidget({
    super.key,
    required this.image,
    required this.name,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: Image(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ).image,
        ),
        Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        Text(position, style: TextStyle(fontSize: 10)),
        SizedBox(height: 10),
      ],
    );
  }
}
