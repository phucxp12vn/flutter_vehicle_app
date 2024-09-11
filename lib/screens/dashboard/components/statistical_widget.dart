import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:redux/redux.dart';
import '../../../store/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../store/actions/count.dart';

class StatisticalWidget extends StatelessWidget {
  const StatisticalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<double>>(
      converter: _clickDataConverter,
      builder: (context, clickData) => _buildChart(context, clickData),
    );
  }

  List<double> _clickDataConverter(Store<AppState> store) {
    return store.state.countState.counts.values
        .map((e) => e.toDouble())
        .toList();
  }

  Widget _buildChart(BuildContext context, List<double> clickData) {
    final List<String> categories = _getCategoryNames();

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Click Count by Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: _getMaxY(clickData),
                  barTouchData: _buildBarTouchData(categories),
                  titlesData: _buildTitlesData(categories),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: _buildBarGroups(clickData),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getCategoryNames() {
    return CountCategory.values
        .map((e) => e.toString().split('.').last.capitalize())
        .toList();
  }

  double _getMaxY(List<double> clickData) {
    return clickData.reduce((a, b) => a > b ? a : b) * 1.2;
  }

  BarTouchData _buildBarTouchData(List<String> categories) {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.blueAccent,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            '${categories[group.x]}\n${rod.toY.round()}',
            const TextStyle(color: Colors.white),
          );
        },
      ),
    );
  }

  FlTitlesData _buildTitlesData(List<String> categories) {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              categories[value.toInt()],
              style: const TextStyle(fontSize: 10),
            ),
          ),
          reservedSize: 42,
        ),
      ),
      leftTitles: AxisTitles(
        drawBelowEverything: true,
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) => Text(
            value.toInt().toString(),
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  List<BarChartGroupData> _buildBarGroups(List<double> clickData) {
    return clickData.asMap().entries.map((entry) {
      return BarChartGroupData(
        x: entry.key,
        barRods: [
          BarChartRodData(
            toY: entry.value,
            color: Colors.blue,
            width: 16,
          ),
        ],
      );
    }).toList();
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
