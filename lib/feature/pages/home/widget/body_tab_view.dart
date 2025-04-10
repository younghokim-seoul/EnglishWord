import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:englishword/core/constants/word_board_tab_type.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:englishword/feature/base/base_page.dart';
import 'package:englishword/feature/pages/home/home_event.dart';
import 'package:englishword/feature/pages/home/provider/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BodyTabView extends BasePage with HomeState, HomeEvent {
  const BodyTabView({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    return targetedTopics(ref, WordBoardTabType.body).when(
      data: (model) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 11,
            childAspectRatio: 162 / 53,
          ),
          itemCount: model.parsedWords.length,
          itemBuilder: (context, index) {
            final topic = model.parsedWords[index];
            return InkWell(
              onTap: () => routeToDepth(ref,model,topic),
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
    );
  }
}
