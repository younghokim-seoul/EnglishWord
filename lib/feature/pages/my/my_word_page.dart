import 'dart:ui';

import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:englishword/core/audio/audio_manager.dart';
import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/core/router/router.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:englishword/feature/base/base_page.dart';
import 'package:englishword/feature/pages/my/my_word_provider.dart';
import 'package:englishword/feature/widget/app_bar/depth_page_app_bar.dart';
import 'package:englishword/feature/widget/mean/combine_mean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyWordPage extends BasePage {
  const MyWordPage({super.key});

  @override
  void onInit(WidgetRef ref) {
    // TODO: implement onInit
    super.onInit(ref);
    ref.read(myWordProviderProvider.notifier).getMyWordList();
  }

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return const MyWordList();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return const DepthPageAppBar();
  }
}

class MyWordList extends ConsumerWidget {
  const MyWordList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(
      myWordProviderProvider.select((state) => state.myWordList),
    );

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: BounceTapper(
                  onTap: () {
                    ref
                        .watch(myWordProviderProvider.notifier)
                        .deleteMyWord(item);
                  },
                  child: const Icon(CupertinoIcons.trash, size: 24),
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
                              child: Icon(
                                CupertinoIcons.speaker_3,
                              ),
                            ),
                          ),
                          const Spacer(),
                          BounceTapper(
                            onTap: () {
                              const route = ExampleDepthRoute();
                              route.updateArg(
                                exampleWord: item.word,
                                exampleSeq: item.p_word,
                              );
                              route.push(ref.context);
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
                                .watch(
                                  myWordProviderProvider.select(
                                    (state) => state.blurList,
                                  ),
                                )
                                .contains(item);

                        return BounceTapper(
                          onTap: () {
                            ref
                                .watch(myWordProviderProvider.notifier)
                                .toggleBlur(item);
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
                              duration: const Duration(milliseconds: 60),
                              child: ImageFiltered(
                                enabled: isBlur,
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 8,
                                  sigmaY: 8,
                                ),
                                child: CombineMean(means: item.parsedWordList),
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
  }
}
