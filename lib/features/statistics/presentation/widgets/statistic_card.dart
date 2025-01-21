import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/widgets/barrel.dart';

class StatisticsCard extends StatelessWidget {
  final Color color;
  final String title;
  final String? number;

  const StatisticsCard({
    super.key,
    required this.color,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.only(bottom: context.spaceM),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.semiBold18?.copyWith(
              color: Colors.black,
            ),
          ).tr(),
          SizedBox(height: context.spaceM),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerGenerator(
                circle: true,
                visible: number == null,
                child: Text(
                  number ?? '44',
                  style: context.semiBold32?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: context.spaceS),
              Text(
                "quake_happened",
                style: context.regular18?.copyWith(
                  color: Colors.black,
                ),
              ).tr()
            ],
          ),
        ],
      ),
    );
  }
}
