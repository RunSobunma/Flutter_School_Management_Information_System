import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';

class GpaPiechatWidget extends StatefulWidget {
  final double gpa;

  const GpaPiechatWidget({super.key, required this.gpa});

  @override
  State<GpaPiechatWidget> createState() => _GpaPiechatWidgetState();
}

class _GpaPiechatWidgetState extends State<GpaPiechatWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _gpaAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // animation time
    );

    _gpaAnimation = Tween<double>(
      begin: 0,
      end: widget.gpa,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _gpaAnimation,
      builder: (context, child) {
        double animatedValue = _gpaAnimation.value;

        return Column(
          children: [
            const SizedBox(height: 10),

            Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  dataMap: {
                    "GPA": animatedValue,
                    "Remaining": 4.0 - animatedValue,
                  },
                  chartType: ChartType.ring,
                  ringStrokeWidth: 20,
                  chartRadius: 140,
                  baseChartColor: Colors.grey.shade300,

                  // 🔥 Colors animate correctly
                  colorList: [AppColors.textAccent, Colors.grey.shade300],

                  legendOptions: const LegendOptions(showLegends: false),
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValues: false,
                  ),

                  animationDuration: const Duration(milliseconds: 2000),
                ),

                Text(
                  animatedValue.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textVariantPrimary,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
