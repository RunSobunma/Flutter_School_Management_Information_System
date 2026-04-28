import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';

class Holiday {
  final String name;
  final DateTime date;

  Holiday({required this.name, required this.date});

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      name: json['name'] ?? 'Unknown',
      date: DateTime.parse(json['date']),
    );
  }
}

class HolidayWidget extends StatefulWidget {
  final int year;
  const HolidayWidget({Key? key, required this.year}) : super(key: key);

  @override
  State<HolidayWidget> createState() => _HolidayWidgetState();
}

class _HolidayWidgetState extends State<HolidayWidget> {
  late Future<List<Holiday>> _futureHolidays;

  @override
  void initState() {
    super.initState();
    _futureHolidays = fetchHolidays(widget.year);
  }

  Future<List<Holiday>> fetchHolidays(int year) async {
    final url = Uri.parse(
      'https://api.11holidays.com/v1/holidays?country=KH&year=$year',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> arr = json.decode(response.body);
        return arr.map((e) => Holiday.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load holidays');
      }
    } on SocketException {
      throw Exception("No Internet connection");
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> _refresh() async {
    setState(() {
      _futureHolidays = fetchHolidays(widget.year);
    });
    await _futureHolidays; // Wait for reload
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      color: AppColors.primary,
      child: FutureBuilder<List<Holiday>>(
        future: _futureHolidays,
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error
          if (snapshot.hasError) {
            final errorMsg = snapshot.error.toString();
            if (errorMsg.contains('No Internet')) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 200),
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.wifi_off, color: AppColors.error, size: 40),
                        const SizedBox(height: 8),
                        const Text(
                          'No Internet Connection.\nSwipe down to refresh.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: 200),
                Center(
                  child: Text(
                    'Error: $errorMsg\nSwipe down to refresh.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.error),
                  ),
                ),
              ],
            );
          }

          // No data
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: const [
                SizedBox(height: 200),
                Center(child: Text('No holidays found.')),
              ],
            );
          }

          final holidays = snapshot.data!;

          // Success
          return Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Holiday Schedule for ${widget.year}",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textVariantPrimary,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: holidays.length,
                  itemBuilder: (context, index) {
                    final h = holidays[index];
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.secondary),
                        borderRadius: BorderRadius.circular(
                          AppSizes.radiusMedium,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              h.name,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${h.date.toLocal()}'.split(' ')[0],
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
