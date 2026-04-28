import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';
import 'package:smis_mobile/widgets/attendances_widget.dart';

class AttendanceYearScreen extends StatefulWidget {
  final int year;
  const AttendanceYearScreen({super.key, required this.year});

  @override
  State<AttendanceYearScreen> createState() => _AttendanceYearScreenState();
}

class _AttendanceYearScreenState extends State<AttendanceYearScreen> {
  String selectedSemester = "Semester 1";
  String selectedFilter = "All";
  String? selectedSubject;

  final List<Map<String, dynamic>> data = [
    {
      "class": "A4",
      "subjects": [
        {
          "subjectName": "Mobile App Development",
          "lecturer": "Dr. Run Sobunma",
          "attendance": [
            {
              "semester": 1,
              "records": [
                {"status": 1, "date": "Mon, Oct 07 at 08:30AM"},
                {"status": 2, "date": "Tue, Oct 08 at 08:30AM"},
                {"status": 3, "date": "Wed, Oct 09 at 08:30AM"},
                {"status": 4, "date": "Thu, Oct 10 at 08:30AM"},
                {"status": 1, "date": "Mon, Oct 07 at 08:30AM"},
                {"status": 2, "date": "Tue, Oct 08 at 08:30AM"},
                {"status": 3, "date": "Wed, Oct 09 at 08:30AM"},
                {"status": 4, "date": "Thu, Oct 10 at 08:30AM"},
              ],
            },
            {
              "semester": 2,
              "records": [
                {"status": 1, "date": "Mon, Mar 03 at 08:30AM"},
                {"status": 2, "date": "Tue, Mar 04 at 08:30AM"},
                {"status": 3, "date": "Wed, Mar 05 at 08:30AM"},
                {"status": 4, "date": "Thu, Mar 06 at 08:30AM"},
              ],
            },
          ],
        },
        {
          "subjectName": "Database Systems",
          "lecturer": "Dr. Sovan Piseth",
          "attendance": [
            {
              "semester": 1,
              "records": [
                {"status": 1, "date": "Mon, Oct 07 at 01:30PM"},
                {"status": 3, "date": "Tue, Oct 08 at 01:30PM"},
                {"status": 4, "date": "Wed, Oct 09 at 01:30PM"},
              ],
            },
            {
              "semester": 2,
              "records": [
                {"status": 2, "date": "Mon, Mar 03 at 01:30PM"},
                {"status": 1, "date": "Tue, Mar 04 at 01:30PM"},
                {"status": 4, "date": "Wed, Mar 05 at 01:30PM"},
              ],
            },
          ],
        },
        {
          "subjectName": "Computer Networks",
          "lecturer": "Dr. Chan Dara",
          "attendance": [
            {
              "semester": 1,
              "records": [
                {"status": 1, "date": "Mon, Oct 07 at 03:00PM"},
                {"status": 2, "date": "Tue, Oct 08 at 03:00PM"},
                {"status": 3, "date": "Wed, Oct 09 at 03:00PM"},
              ],
            },
            {
              "semester": 2,
              "records": [
                {"status": 4, "date": "Mon, Mar 03 at 03:00PM"},
                {"status": 3, "date": "Tue, Mar 04 at 03:00PM"},
              ],
            },
          ],
        },
      ],
    },
  ];

  List<String> get subjectNames => data.first["subjects"]
      .map<String>((e) => e["subjectName"] as String)
      .toList();

  List<Map<String, dynamic>> getFilteredData() {
    final int semesterNum = selectedSemester == "Semester 1" ? 1 : 2;
    final subjects = data.first["subjects"] as List;
    final subjectData = selectedSubject == null
        ? subjects
        : subjects.where((s) => s["subjectName"] == selectedSubject).toList();

    List<Map<String, dynamic>> records = [];
    for (var subject in subjectData) {
      for (var att in subject["attendance"]) {
        if (att["semester"] == semesterNum) {
          records.addAll(att["records"]);
        }
      }
    }

    if (selectedFilter == "All") return records;
    switch (selectedFilter) {
      case "Present":
        return records.where((e) => e["status"] == 1).toList();
      case "Absent":
        return records.where((e) => e["status"] == 2).toList();
      case "Permission":
        return records.where((e) => e["status"] == 3).toList();
      case "Late":
        return records.where((e) => e["status"] == 4).toList();
      default:
        return records;
    }
  }

  Map<String, int> getAttendanceSummary() {
    final int semesterNum = selectedSemester == "Semester 1" ? 1 : 2;

    // Get selected subject data
    final subjects = data.first["subjects"] as List;
    final subjectData = selectedSubject == null
        ? subjects
        : subjects.where((s) => s["subjectName"] == selectedSubject).toList();

    int present = 0;
    int absent = 0;
    int permission = 0;
    int late = 0;

    for (var subject in subjectData) {
      for (var att in subject["attendance"]) {
        if (att["semester"] == semesterNum) {
          for (var record in att["records"]) {
            switch (record["status"]) {
              case 1:
                present++;
                break;
              case 2:
                absent++;
                break;
              case 3:
                permission++;
                break;
              case 4:
                late++;
                break;
            }
          }
        }
      }
    }

    return {
      "PRESENT": present,
      "ABSENT": absent,
      "PERMISSION": permission,
      "LATE": late,
    };
  }

  @override
  Widget build(BuildContext context) {
    final summary = getAttendanceSummary();
    final filteredRecords = getFilteredData();

    // Get selected subject info for card
    final subjectInfo = selectedSubject == null
        ? data.first["subjects"].first
        : (data.first["subjects"] as List).firstWhere(
            (s) => s["subjectName"] == selectedSubject,
          );
    final String myClass = data.first["class"];
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
                "Year ${widget.year}",
                style: AppTextStyles.heading,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              centerTitle: true,
            ),

            // 🔥 Divider under AppBar
            // const Divider(
            //   color: Color.fromARGB(255, 214, 213, 213),
            //   thickness: 2,
            //   height: 0,
            // ),
          ],
        ),
      ),

      body: Column(
        children: [
          // ContentTitleWidget(title: "Year${widget.year}"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.paddingMedium,
                right: AppSizes.paddingMedium,
                top: AppSizes.paddingMedium,
              ),
              child: Column(
                children: [
                  // --- Semester Tabs
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildSemesterTab("Semester 1"),
                          _line(1, 25),
                          _buildSemesterTab("Semester 2"),
                        ],
                      ),
                      SizedBox(height: 2),
                      _line(double.infinity, 1),
                    ],
                  ),

                  // --- Dropdown on right
                  _buildSubjectDropdown(),

                  // Subject Card (updates dynamically)
                  Container(
                    padding: const EdgeInsets.all(AppSizes.paddingMedium),
                    decoration: BoxDecoration(
                      // color: AppColors.textVariantPrimary,
                      color: const Color.fromARGB(211, 212, 69, 69),
                      borderRadius: BorderRadius.circular(
                        AppSizes.radiusMedium,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subjectInfo["subjectName"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: AppSizes.textLarge,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subjectInfo["lecturer"],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: AppSizes.textMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.book_outlined,
                              size: 25,
                              color: AppColors.textWhite,
                            ),
                            Text(
                              myClass,
                              style: TextStyle(
                                color: AppColors.textWhite,
                                fontSize: AppSizes.textLarge,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildSummaryCard(
                            "PRESENT",
                            summary["PRESENT"].toString(),
                          ),
                          _line(1, 25),
                          _buildSummaryCard(
                            "ABSENT",
                            summary["ABSENT"].toString(),
                          ),
                          _line(1, 25),
                          _buildSummaryCard(
                            "PERMISSION",
                            summary["PERMISSION"].toString(),
                          ),
                          _line(1, 25),
                          _buildSummaryCard("LATE", summary["LATE"].toString()),
                        ],
                      ),
                      SizedBox(height: 2),
                      _line(double.infinity, 1),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Filter Buttons
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterButton("All"),
                        _buildFilterButton("Present"),
                        _buildFilterButton("Absent"),
                        _buildFilterButton("Permission"),
                        _buildFilterButton("Late"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Attendance List
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AttendanceWidget(data: filteredRecords),
                          const SizedBox(height: 10),
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

  // --- Helper Widgets ---
  Widget _buildSemesterTab(String title) {
    final bool isSelected = selectedSemester == title;
    return GestureDetector(
      onTap: () => setState(() => selectedSemester = title),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
          // border: Border.all(color: isSelected ? Colors.redAccent),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppColors.textWhite : AppColors.textDarkGrey,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.textMedium,
          ),
        ),
      ),
    );
  }

  Widget _buildSubjectDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: null, // Always show only label "Subject"
              hint: Row(
                children: const [
                  SizedBox(width: 100),
                  Text(
                    "Subject",
                    style: TextStyle(
                      fontSize: AppSizes.radiusSmall,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              items: subjectNames
                  .map(
                    (subject) => DropdownMenuItem<String>(
                      value: subject,
                      child: SizedBox(
                        width: 400, // ✅ Set dropdown menu width
                        child: Text(
                          subject,
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis, // ✅ Prevent wrapping
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubject = value;
                });
              },
              selectedItemBuilder: (context) => subjectNames
                  .map((subject) => const SizedBox.shrink())
                  .toList(),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.primary,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String label, String count) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: AppSizes.textSmall,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          count == '0' ? '0' : count.toString().padLeft(2, '0'),
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: AppSizes.textLarge,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String label) {
    final bool isActive = selectedFilter == label;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () => setState(() => selectedFilter = label),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          minimumSize: Size(0, 0), // 👈 removes default min height
          tapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // 👈 reduces extra space
          backgroundColor: isActive
              ? AppColors.textVariantPrimary
              : AppColors.background,
          foregroundColor: isActive
              ? AppColors.textWhite
              : AppColors.textVariantPrimary,
          side: const BorderSide(color: AppColors.textVariantPrimary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),

        child: Text(label),
      ),
    );
  }
}

Widget _line(double width, double height) {
  return Container(
    width: width,
    height: height,
    color: AppColors.textSecondary,
  );
}
