import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:englishword/feature/base/base_page.dart';
import 'package:englishword/feature/pages/depth/depth_event.dart';
import 'package:englishword/feature/pages/depth/depth_state.dart';
import 'package:englishword/feature/pages/depth/widget/depth_step_bar.dart';
import 'package:englishword/feature/widget/app_bar/depth_page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class DepthPage extends BasePage with DepthState, DepthEvent {
  const DepthPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    logger.d("DepthPage create...");
    return Column(
      children: [
        DepthStepBar(combineHeader(ref)),
        getSubWordWithWords(ref).when(
          data: (model) {
            logger.d("DepthPage model... $model");
            return GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 11,
                childAspectRatio: 162 / 53,
              ),
              itemCount: model!.parsedWords.length,
              itemBuilder: (context, index) {
                final topic = model.parsedWords[index];
                return BounceTapper(
                  onTap:
                      () => routeToDeepDepth(
                        ref,
                        arg(ref).model,
                        arg(ref).depth2,
                        topic,
                      ),
                  highlightColor: AppColor.of.yellow2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColor.of.background1),
                    ),
                    child: Center(
                      child: Text(
                        topic,
                        style: AppTextStyle.headline3,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                );
              },
            );
          },
          error: (e, __) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return const DepthPageAppBar();
  }
}
