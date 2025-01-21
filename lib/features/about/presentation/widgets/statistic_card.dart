import 'package:flutter/material.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';

class StatisticsCard extends StatelessWidget {
  final Color color;
  final String title;

  const StatisticsCard({
    super.key,
    required this.color,
    required this.title,
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
          ),
          SizedBox(height: context.spaceM),
          RichText(
            text: TextSpan(
              text: '44 ',
              style: context.semiBold32?.copyWith(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "zilzila sodir bo'ldi",
                  style: context.regular18?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
