import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'package:seysmoprognoz/core/network/dio_client.dart';
import 'package:seysmoprognoz/core/network/endpoints.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';

import '../widgets/statistic_card.dart';

const items = ["kunlik", "haftalik", "oylik", "yillik"];

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});
  static const String routeName = 'statistics';

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool loading = true;
  Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("statistics").tr(),
      ),
      body: AppContainer(
        hasTopPadding: true,
        child: FutureBuilder<Map<String, dynamic>>(
          future: _getStatistics(),
          builder: (context, snapshot) {
            return _buildCards(snapshot.data);
          },
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> _getStatistics() async {
    final res = await DioClient(Dio()).get(Endpoints.statisticsApi);

    return {
      'kunlik': res.data['kunlik'].length.toString(),
      'haftalik': res.data['haftalik'].length.toString(),
      'oylik': res.data['oylik'].length.toString(),
      'yillik': res.data['yillik'].length.toString(),
    };
  }

  Widget _buildCards(Map<String, dynamic>? data) {
    return Column(
      children: AppGlobals.statistics
          .map((e) => StatisticsCard(
                title: e.title,
                color: e.color,
                number: data?[e.title],
              ))
          .toList(),
    );
  }
}
