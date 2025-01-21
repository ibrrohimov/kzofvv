import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.child,
    this.hasTopPadding = false,
    this.hasBottomPadding = false,
  });

  final bool hasTopPadding;
  final bool hasBottomPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: hasTopPadding ? 20 : 0,
        bottom: hasBottomPadding ? 20 : 0,
      ),
      child: child,
    );
  }
}
