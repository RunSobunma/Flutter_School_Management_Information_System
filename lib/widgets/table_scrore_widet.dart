import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';

class TableScoreWidget extends StatefulWidget {
  final Map<String, dynamic> semesterData;
  final String title;

  const TableScoreWidget({
    super.key,
    required this.semesterData,
    required this.title,
  });

  @override
  State<TableScoreWidget> createState() => _TableScoreWidgetState();
}

class _TableScoreWidgetState extends State<TableScoreWidget> {
  final ScrollController _verticalController = ScrollController();
  final ScrollController _horizontalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final scores = widget.semesterData;

    // Screen width minus the fixed "Subject" column
    double screenWidth = MediaQuery.of(context).size.width;
    int columnCount = 4; // Attend, Assign, Midterm, Final
    double subjectColumnWidth = 90;
    double columnWidth =
        (screenWidth - subjectColumnWidth - 30) /
        columnCount; // 16 is padding for safety

    return Column(
      children: [
        Center(child: Text(widget.title, style: AppTextStyles.heading)),
        const SizedBox(height: 10),
        Scrollbar(
          controller: _verticalController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _verticalController,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fixed subject column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: const Color(0xFF8A2C2C),
                      padding: const EdgeInsets.all(8),
                      width: subjectColumnWidth,
                      child: const Text(
                        "Subject",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.textSmall,
                        ),
                      ),
                    ),
                    ...scores.keys.map((subject) {
                      return Container(
                        width: subjectColumnWidth,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black12),
                          ),
                        ),
                        child: Text(
                          subject,
                          maxLines: 1,
                          style: const TextStyle(fontSize: AppSizes.textSmall),
                        ),
                      );
                    }),
                  ],
                ),

                // Scrollable content
                Expanded(
                  child: Scrollbar(
                    controller: _horizontalController,
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      controller: _horizontalController,
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header row
                          Row(
                            children: [
                              _HeaderCell("Attend", columnWidth),
                              _HeaderCell("Assign", columnWidth),
                              _HeaderCell("Midterm", columnWidth),
                              _HeaderCell("Final", columnWidth),
                            ],
                          ),
                          // Data rows
                          ...scores.entries.map((entry) {
                            final detail = entry.value as Map<String, dynamic>;
                            return Row(
                              children: [
                                _DataCell("${detail['Attend']}", columnWidth),
                                _DataCell("${detail['Assign']}", columnWidth),
                                _DataCell("${detail['Midterm']}", columnWidth),
                                _DataCell("${detail['Final']}", columnWidth),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

// Helper widgets
class _HeaderCell extends StatelessWidget {
  final String text;
  final double width;
  const _HeaderCell(this.text, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: const Color(0xFF8A2C2C),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: AppSizes.textSmall,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;
  final double width;
  const _DataCell(this.text, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: AppSizes.textSmall),
        textAlign: TextAlign.center,
      ),
    );
  }
}
