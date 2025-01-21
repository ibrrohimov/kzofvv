import 'package:flutter/material.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/statistic_card.dart';

class UsefulInfoScreen extends StatefulWidget {
  const UsefulInfoScreen({super.key});
  static const String routeName = 'useful_info';

  @override
  State<UsefulInfoScreen> createState() => _UsefulInfoScreenState();
}

class _UsefulInfoScreenState extends State<UsefulInfoScreen> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
      4,
      (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: StatisticsCard(
          usefulInfo: AppGlobals.usefulInfo[index],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 450,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (_, index) {
                return pages[index % pages.length];
              },
            ),
          ),
          SizedBox(height: context.spaceM),
          SmoothPageIndicator(
            controller: controller,
            count: 4,
            effect: WormEffect(
              dotColor: context.greyScale7,
              activeDotColor: context.primary1,
              dotHeight: 16,
              dotWidth: 16,
            ),
          ),
        ],
      ),
    );
  }
}
