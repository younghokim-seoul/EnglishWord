import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:englishword/feature/pages/home/provider/topics_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BodyTabView extends HookConsumerWidget {
  const BodyTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    final topics = ref.watch(sortedTopicsProvider);
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 11,
        childAspectRatio: 162 / 53
      ),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        final topic = topics[index];

        return BounceTapper(
          onTap: () {},
          highlightColor: AppColor.of.yellow2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
  }
}
