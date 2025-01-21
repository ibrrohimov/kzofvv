import 'package:flutter/material.dart';

class MenuEntity {
  final IconData icon;
  final String title;
  final Widget? bottomWidget;
  final String routeName;
  final bool bottomBorder;

  const MenuEntity({
    required this.icon,
    required this.title,
    this.bottomWidget,
    required this.routeName,
    this.bottomBorder = false,
  });
}
