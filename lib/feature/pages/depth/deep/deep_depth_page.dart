import 'dart:ui';

import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:englishword/core/audio/audio_manager.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:englishword/feature/base/base_page.dart';
import 'package:englishword/feature/pages/depth/deep/deep_depth_event.dart';
import 'package:englishword/feature/pages/depth/deep/deep_depth_state.dart';
import 'package:englishword/feature/pages/depth/provider/favorite_provider.dart';
import 'package:englishword/feature/pages/depth/widget/depth_step_bar.dart';
import 'package:englishword/feature/pages/depth/widget/favorite_icon.dart';
import 'package:englishword/feature/widget/app_bar/depth_page_app_bar.dart';
import 'package:englishword/feature/widget/mean/combine_mean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DeepDepthPage extends BasePage with DeepDepthState, DeepDepthEvent {
  const DeepDepthPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        DepthStepBar(getDeepDepthHeader(ref)),
        Expanded(
          child: getDeepWordWithWords(ref).when(
            data: (model) {
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: model!.parsedWordList.length,
                itemBuilder: (context, index) {
                  final item = model.parsedWordList[index];

                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: FavoriteIconButton(
                            pWord: arg(ref).depth3,
                            model: item,
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: AppColor.borderNormal,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    BounceTapper(
                                      onTap: () {},
                                      enable: false,
                                      child: Text(
                                        item.word,
                                        style: AppTextStyle.body3.copyWith(
                                          color:
                                              item.isBold
                                                  ? AppColor.depthBoldBlue
                                                  : AppColor.depthBold,
                                        ),
                                      ),
                                    ),
                                    const Gap(10),
                                    BounceTapper(
                                      onTap: () async {
                                        await AudioManager.intance.play(
                                          item.word,
                                        );
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 2,
                                        ),
                                        child: Icon(CupertinoIcons.speaker_3),
                                      ),
                                    ),
                                    const Spacer(),
                                    BounceTapper(
                                      onTap: () {
                                        routeToExampleDepth(
                                          ref,
                                          item.word,
                                          int.parse(item.means.first.seq),
                                        );
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 2,
                                        ),
                                        child: Icon(
                                          CupertinoIcons.right_chevron,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(1),
                              Consumer(
                                builder: (context, ref, child) {
                                  final isBlur =
                                      !ref
                                          .watch(blurProviderProvider)
                                          .contains(item.word);

                                  return BounceTapper(
                                    onTap: () {
                                      ref
                                          .read(blurProviderProvider.notifier)
                                          .toggleBlur(item.word);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:
                                            isBlur
                                                ? AppColor.of.brand5
                                                : AppColor.of.yellow2,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: AnimatedOpacity(
                                        opacity: isBlur ? 0.2 : 1,
                                        duration: const Duration(
                                          milliseconds: 60,
                                        ),
                                        child: ImageFiltered(
                                          enabled: isBlur,
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 8,
                                            sigmaY: 8,
                                          ),
                                          child: CombineMean(means: item.means),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            error: (e, __) => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return const DepthPageAppBar();
  }
}
