import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:collection/collection.dart';
import 'package:englishword/core/constants/assets.dart';
import 'package:englishword/core/router/router.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:englishword/feature/pages/depth/depth_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DepthStepBar extends ConsumerWidget with DepthState {
  const DepthStepBar(this.depths, {super.key});

  static const double appbarHeight = 68;

  final List<String> depths;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: Row(
        children: [
          combineDepthHeader(depths),
          const Spacer(),
          BounceTapper(
            onTap: () {
              const route = MyWordRoute();
              route.push(ref.context);
            },
            child: Image.asset(Assets.myWord, height: 24, width: 24),
          ),
        ],
      ),
    );
  }

  Widget combineDepthHeader(List<String> depths) {
    if (depths.isEmpty) const SizedBox.shrink();
    final List<TextSpan> spans = [];

    depths.forEachIndexed((index, element) {
      spans.add(
        TextSpan(
          text: element,
          style:
              index != depths.length -1
                  ? AppTextStyle.body3.copyWith(color: AppColor.depthNormal)
                  : AppTextStyle.title1.copyWith(color: AppColor.depthBold),
        ),
      );

      if (index != depths.length - 1) {
        spans.add(
          TextSpan(
            text: '  >  ',
            style:
                index == depths.length - 2
                    ? AppTextStyle.title1.copyWith(color: AppColor.depthBold)
                    : AppTextStyle.body3.copyWith(color: AppColor.depthNormal),
          ),
        );
      }
    });

    return RichText(text: TextSpan(children: spans));
  }
}
