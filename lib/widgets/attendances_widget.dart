import 'package:flutter/material.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class AttendanceWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const AttendanceWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = data[index];
        final status = item["status"];
        final date = item["date"];

        Color bgColor;
        String title;
        String iconName;

        switch (status) {
          case 1:
            title = "Present";
            bgColor = Color(0xFF00AD30);
            iconName = "check.png";
            break;
          case 2:
            title = "Absent";
            bgColor = Color(0xFFFA4442);
            iconName = "absent.png";
            break;
          case 3:
            title = "Permission";
            bgColor = Color(0xFF00AAF0);
            iconName = "permission.png";
            break;
          case 4:
            title = "Late";
            bgColor = Color(0xFFDE8E2F);
            iconName = "late.png";
            break;
          default:
            title = "Unknown";
            bgColor = Colors.grey;
            iconName = "unknown.png";
        }

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondary),
            borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: bgColor,
                  radius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      "${AppConstants.iconsPath}$iconName",
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
