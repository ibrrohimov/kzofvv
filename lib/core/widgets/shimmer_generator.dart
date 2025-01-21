import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGenerator extends StatelessWidget {
  // final double width;
  // final double height;
  final bool circle;
  final bool visible;
  final Widget child;

  const ShimmerGenerator({
    Key? key,
    this.circle = false,
    required this.child,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return visible
        ? Shimmer.fromColors(
            baseColor: const Color(0xFFdae5f1),
            highlightColor: const Color.fromARGB(255, 255, 255, 255),
            child: Container(
              clipBehavior: Clip.hardEdge,
              // width: width,
              // height: height,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: circle ? null : BorderRadius.circular(8.0),
                shape: circle ? BoxShape.circle : BoxShape.rectangle,
              ),
              child: child,
            ),
          )
        : child;
  }
}
