import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seysmoprognoz/core/config/constants.dart';
import 'package:seysmoprognoz/core/config/extensions.dart';
import 'package:seysmoprognoz/core/cubit/theme_context.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final Function() onTap;

  const AppCard({
    super.key,
    required this.child,
    required this.onTap,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: bgColor ?? (state ? Colors.white : AppColors.darkPrimary2),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(29, 0, 0, 0).withOpacity(0.05),
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
