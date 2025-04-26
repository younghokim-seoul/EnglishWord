import 'package:englishword/core/constants/assets.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.backgroundColor,
    this.actions,
    this.padding,
  });

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
            Text("테마영어단어(Human)", style: AppTextStyle.headline1),
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
