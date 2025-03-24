import 'package:englishword/core/constants/assets.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.backgroundColor, this.actions, this.padding});

  final Color? backgroundColor;
  final List<Widget>? actions;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        height: 65,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
        color: backgroundColor ?? Colors.white,
        child: Row(
          children: [
            Image.asset(Assets.titleLogo, height: 52),
            const Spacer(),
            ...?actions,
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
