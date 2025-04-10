import 'package:englishword/core/constants/assets.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';


class BackButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackButtonAppBar({
    super.key,
    this.title,
    this.onBackBtnTapped,
    this.actions,
  });

  final String? title;
  final VoidCallback? onBackBtnTapped;
  final List<Widget>? actions;

  static const double appbarHeight = 56;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AppBar(
            titleSpacing: 0,
            backgroundColor: AppColor.of.white,
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: actions,
            toolbarHeight: appbarHeight,
            leading: AppBackButton(
              onBackBtnTapped: onBackBtnTapped ?? context.pop,
            ),
          ),
          Positioned(
            left: 48,
            child: Text(
              title ?? '',
              style: AppTextStyle.headline2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}


class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onBackBtnTapped,
  });

  final VoidCallback? onBackBtnTapped;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBackBtnTapped ?? context.pop,
      icon: SvgPicture.asset(
        Assets.iconsIconAppBarLeft,
        height: 24,
        width: 24,
      ),
    );
  }
}
