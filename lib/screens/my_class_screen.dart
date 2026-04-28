import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:intl/intl.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'dart:async';

class MyClassScreen extends StatefulWidget {
  const MyClassScreen({super.key});

  @override
  State<MyClassScreen> createState() => _MyClassScreenState();
}

class _MyClassScreenState extends State<MyClassScreen> {
  Timer? _timer;
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  final Map<String, List<Map<String, String>>> schedule = {
    "Mon": [
      {
        "subject": "Window Server Admin",
        "time": "2:00pm - 3:30pm",
        "room": "Room: 105",
        "teacher": "Mr. Pok Leakmony",
      },
      {
        "subject": "SE & IT PM",
        "time": "3:45pm - 5:15pm",
        "room": "Room: 105",
        "teacher": "Mr. Pok Leakmony",
      },
    ],
    "Tue": [
      {
        "subject": "M.I.S",
        "time": "2:00pm - 3:30pm",
        "room": "Room: 102",
        "teacher": "Mr. Ear Eksanthan",
      },
      {
        "subject": "M.I.S",
        "time": "3:45pm - 5:15pm",
        "room": "Room: 102",
        "teacher": "Mr. Ear Eksanthan",
      },
    ],
    "Wed": [
      {
        "subject": "Windows Server Admin",
        "time": "2:00pm - 3:30pm",
        "room": "Room: 105",
        "teacher": "Mr. Loueng Vidal",
      },
      {
        "subject": "S.E and IT PM",
        "time": "9:00am - 11:50am",
        "room": "Room: 105",
        "teacher": "Mr. Loueng Vidal",
      },
    ],
    "Thu": [
      {
        "subject": "OOAD and Prog",
        "time": "2:00pm - 3:30pm",
        "room": "Room: 101",
        "teacher": "Dr. Sok Phalla",
      },
      {
        "subject": "M.I.S",
        "time": "9:00am - 5:22pm",
        "room": "Room: 105",
        "teacher": "Mr. Pok Leakmony",
      },
    ],
    "Fri": [
      {
        "subject": "Networking",
        "time": "2:00pm - 3:30pm",
        "room": "Room: 202",
        "teacher": "Mr. Chan Vichea",
      },
      {
        "subject": "OOAD and Prog",
        "time": "10:12am - 5:15pm",
        "room": "Room: 101",
        "teacher": "Dr. Sok Phalla",
      },
    ],
  };

  // ✅ Auto refresh every 1 minute
  @override
  void initState() {
    super.initState();
    // First refresh immediately
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));

    // Then refresh every 1 minute
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // getCurrentDay
  String getCurrentDay() {
    final weekday = DateTime.now().weekday;
    return days[(weekday - 1).clamp(0, days.length - 1)];
  }

  // ✅ Time check (handles missing AM/PM automatically)
  bool isNowInClass(String timeRange) {
    try {
      final parts = timeRange.split('-');
      if (parts.length != 2) return false;

      String start = parts[0].trim().toUpperCase();
      String end = parts[1].trim().toUpperCase();

      start = start.replaceAll(' ', '');
      end = end.replaceAll(' ', '');

      // Add missing AM/PM if needed
      if (!start.contains('AM') && !start.contains('PM')) {
        if (end.contains('AM')) start += 'AM';
        if (end.contains('PM')) start += 'PM';
      }
      if (!end.contains('AM') && !end.contains('PM')) {
        if (start.contains('AM')) end += 'AM';
        if (start.contains('PM')) end += 'PM';
      }

      final dateFormat = DateFormat('h:mma');
      final now = DateTime.now();

      DateTime startTime = dateFormat.parse(start);
      DateTime endTime = dateFormat.parse(end);

      startTime = DateTime(
        now.year,
        now.month,
        now.day,
        startTime.hour,
        startTime.minute,
      );
      endTime = DateTime(
        now.year,
        now.month,
        now.day,
        endTime.hour,
        endTime.minute,
      );

      if (endTime.isBefore(startTime)) {
        endTime = endTime.add(const Duration(days: 1));
      }

      return now.isAfter(startTime) && now.isBefore(endTime);
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final currentDay = getCurrentDay();

    final allSessions = <Map<String, dynamic>>[];
    for (var day in days) {
      final sessions = schedule[day] ?? [];
      for (var session in sessions) {
        allSessions.add({"day": day, ...session});
      }
    }

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
                "My Class",
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                top: 20,
                left: AppSizes.paddingMedium,
                right: AppSizes.paddingMedium,
                bottom: AppSizes.paddingMedium,
              ),
              children: days.map((day) {
                final sessions = schedule[day] ?? [];

                return Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    // width: 330,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: SizedBox(
                            width: 60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  day,
                                  style: const TextStyle(
                                    fontSize: AppSizes.textMedium,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF8A2C2C),
                                  ),
                                ),

                                Container(
                                  width: 14,
                                  height: 2.1,
                                  color: AppColors.secondary,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // --- Each session in that day ---
                            ...sessions.map((session) {
                              final currentDay = getCurrentDay();
                              final isCurrent =
                                  (day == currentDay) &&
                                  isNowInClass(session["time"] ?? "");

                              return Padding(
                                padding: const EdgeInsets.only(left: 46),
                                child: TimelineTile(
                                  // alignment: TimelineAlign.manual,
                                  // lineXY: 0.2,
                                  beforeLineStyle: const LineStyle(
                                    color: Colors.grey,
                                    thickness: 2,
                                  ),
                                  afterLineStyle: const LineStyle(
                                    color: Colors.grey,
                                    thickness: 2,
                                  ),
                                  indicatorStyle: IndicatorStyle(
                                    width: 26,
                                    indicator: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: isCurrent
                                            ? Border.all(
                                                color: const Color(
                                                  0xFF8A2C2C,
                                                ), // border color
                                                width: 2, // border width
                                              )
                                            : Border.all(
                                                color: Colors.transparent,
                                                width: 2, // border width
                                              ),
                                      ),
                                      child: isCurrent
                                          ? const Icon(
                                              Icons.circle,
                                              color: AppColors.primary,
                                              size: 12,
                                            )
                                          : null,
                                    ),
                                  ),

                                  endChild: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      bottom: 8,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          219,
                                          217,
                                          217,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: isCurrent
                                              ? const Color(0xFF8A2C2C)
                                              : Colors.transparent,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            session["subject"] ?? "",
                                            style: TextStyle(
                                              fontSize: AppSizes.textMedium,
                                              fontWeight: FontWeight.bold,
                                              color: isCurrent
                                                  ? const Color(0xFF8A2C2C)
                                                  : Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            session["time"] ?? "",
                                            style: const TextStyle(
                                              color: AppColors.textPrimary,
                                              fontSize: AppSizes.textSmall,
                                            ),
                                          ),
                                          Text(
                                            session["room"] ?? "",
                                            style: const TextStyle(
                                              color: AppColors.textPrimary,
                                              fontSize: AppSizes.textSmall,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              const CircleAvatar(
                                                radius: 14,
                                                backgroundColor:
                                                    Colors.blueAccent,
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  session["teacher"] ?? "",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        AppSizes.textMedium,
                                                  ),
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
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
