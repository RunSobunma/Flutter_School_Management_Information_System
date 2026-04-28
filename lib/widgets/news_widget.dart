import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:intl/intl.dart';

class NewsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const NewsWidget({super.key, required this.data});

  String timeAgo(String dateString) {
    final date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
    final diff = DateTime.now().difference(date);

    if (diff.inMinutes < 60) {
      return "${diff.inMinutes}m ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours}h ago";
    } else if (diff.inDays < 7) {
      return "${diff.inDays}d ago";
    } else {
      return DateFormat("MMM d, yyyy").format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        final title = item["title"];
        final desc = item["desc"];
        final createdAt = item["createdAt"];

        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: 4,
            bottom: index == data.length - 1 ? 15 : 4,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondary),
            borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title as String,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc as String,
                  style: TextStyle(fontSize: 10, color: AppColors.secondary),
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    timeAgo(createdAt as String),
                    style: TextStyle(
                      fontSize: 9,
                      color: AppColors.textAccent,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      
      },
    );
  }
}
