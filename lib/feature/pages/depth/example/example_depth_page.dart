import 'dart:ui';

import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:englishword/feature/base/base_page.dart';
import 'package:englishword/feature/pages/depth/deep/deep_depth_state.dart';
import 'package:englishword/feature/pages/depth/example/example_depth_state.dart';
import 'package:englishword/feature/pages/depth/provider/favorite_provider.dart';
import 'package:englishword/feature/pages/depth/widget/depth_step_bar.dart';
import 'package:englishword/feature/pages/depth/widget/favorite_icon.dart';
import 'package:englishword/feature/widget/app_bar/depth_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExampleDepthPage extends BasePage with ExampleDepthState {
  const ExampleDepthPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return getExampleWordWithWords(ref).when(
      data: (model) {
        logger.d("ExampleDepthPage => ... $model");

        return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: model.length,
          itemBuilder: (context, index) {
            final item = model[index];


            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            );
          },
        );
      },
      error: (e, __) => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return const DepthPageAppBar();
  }
}
