

import 'package:englishword/feature/widget/app_bar/back_button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DepthPageAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const DepthPageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BackButtonAppBar();
  }
}
