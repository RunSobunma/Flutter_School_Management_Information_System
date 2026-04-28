import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/widgets/news_widget.dart';

class NewsScreen extends StatefulWidget {
  final String category;
  const NewsScreen({super.key, this.category = "All"});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.category;
  }

  final List<Map<String, dynamic>> allNews = [
    {
      "title": "Free Coding Workshop for Students",
      "desc":
          "Join the Computer Science Club’s workshop this Saturday at Room B201.",
      "category": "Events",
      "createdAt": "2025-10-23 10:22:00",
    },
    {
      "title": "Free Coding Workshop for Students",
      "desc":
          "Join the Computer Science Club’s workshop this Saturday at Room B201.",
      "category": "Events",
      "createdAt": "2025-10-15 22:22:00",
    },
    {
      "title": "Cafeteria Menu Updated",
      "desc":
          "New healthy meal options are now available at the campus cafeteria.",
      "category": "News",
      "createdAt": "2025-10-15 22:00:00",
    },
    {
      "title": "New Semester Orientation Announced",
      "desc":
          "The new student orientation will take place on October 20th in the main auditorium.",
      "category": "Announcements",
      "createdAt": "2025-10-13 23:48:21",
    },
    {
      "title": "Library Extends Opening Hours",
      "desc":
          "The campus library will now remain open until 10 PM on weekdays.",
      "category": "News",
      "createdAt": "2025-10-12 18:30:00",
    },
    {
      "title": "Midterm Exam Schedule Released",
      "desc":
          "Check the academic portal for the updated midterm exam timetable.",
      "category": "Announcements",
      "createdAt": "2025-10-10 10:15:30",
    },
    {
      "title": "Free Coding Workshop for Students",
      "desc":
          "Join the Computer Science Club’s workshop this Saturday at Room B201.",
      "category": "Events",
      "createdAt": "2025-10-11 14:00:00",
    },
    {
      "title": "Cafeteria Menu Updated",
      "desc":
          "New healthy meal options are now available at the campus cafeteria.",
      "category": "News",
      "createdAt": "2025-10-09 08:00:00",
    },
  ];

  List<Map<String, dynamic>> get filteredNews {
    if (selectedCategory == "All") return allNews;
    return allNews
        .where((item) => item["category"] == selectedCategory)
        .toList();
  }

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
              elevation: 0,

              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              title: Text(
                "News",
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
          // const ContentTitleWidget(title: "News"),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final category in [
                  "All",
                  "Events",
                  "News",
                  "Scholarships",
                  "Announcements",
                ])
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TextButton(
                      onPressed: () {
                        setState(() => selectedCategory = category);
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: selectedCategory == category
                              ? AppColors.textAccent
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium,
              ),
              child: NewsWidget(data: filteredNews),
            ),
          ),
        ],
      ),
    );
  }
}
