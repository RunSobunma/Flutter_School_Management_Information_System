import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // 🧩 Sample data
  final List<Map<String, String>> notifications = [
    {
      "name": "Independence Day",
      "date": "2025-11-09",
      "createAd": "2025-10-30 10:48:00",
    },
    {
      "name": "Water Festival",
      "date": "2025-11-09",
      "createAd": "2025-10-30 10:47:00",
    },
    {
      "name": "Pchum Ben Day",
      "date": "2025-09-20",
      "createAd": "2025-09-15 10:00:00",
    },
    {
      "name": "King's Birthday",
      "date": "2025-05-14",
      "createAd": "2025-05-10 14:00:00",
    },
    {
      "name": "New Year Holiday",
      "date": "2025-04-13",
      "createAd": "2025-04-10 11:00:00",
    },
    {
      "name": "New Year Holiday",
      "date": "2025-04-13",
      "createAd": "2025-04-10 11:00:00",
    },
  ];

  // 🕒 Improved “time ago” logic
  String timeAgo(String dateString) {
    final date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
    final diff = DateTime.now().difference(date);

    if (diff.inMinutes < 1) {
      return "Now";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes}m ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours}h ago";
    } else if (diff.inDays < 7) {
      return "${diff.inDays}d ago";
    } else {
      return DateFormat("MMM d, yyyy").format(date);
    }
  }

  // 🔹 Smart grouping by time difference
  Map<String, List<Map<String, String>>> _groupNotifications() {
    Map<String, List<Map<String, String>>> grouped = {};

    for (var item in notifications) {
      final created = DateFormat(
        "yyyy-MM-dd HH:mm:ss",
      ).parse(item['createAd']!);
      final diff = DateTime.now().difference(created);

      String key;

      // If less than 1 hour → group separately by exact minute
      if (diff.inHours < 1) {
        key = item['createAd']!; // unique timestamp (1 per notification)
      } else {
        key = item['createAd']!.substring(0, 10); // group by date
      }

      grouped.putIfAbsent(key, () => []);
      grouped[key]!.add(item);
    }

    return grouped;
  }

  String _formatDate(String dateString) {
    final parsed = DateTime.parse(dateString);
    return DateFormat('EEE, MMM d').format(parsed); // e.g. Sun, Nov 9
  }

  @override
  Widget build(BuildContext context) {
    final grouped = _groupNotifications();

    final sortedEntries = grouped.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

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
                "Notifications",
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
          // const ContentTitleWidget(title: 'Notifications'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sortedEntries.map((entry) {
                  final items = entry.value;
                  final first = items.first;
                  final label = timeAgo(first['createAd']!);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: items.map((msg) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "We have three days of holiday for ${msg['name']}",
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _formatDate(msg['date']!),
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
