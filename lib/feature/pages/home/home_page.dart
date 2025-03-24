import 'package:bounce_tapper/bounce_tapper.dart';
import 'package:englishword/core/constants/assets.dart';
import 'package:englishword/core/constants/word_board_tab_type.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_size.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:englishword/feature/base/base_page.dart';
import 'package:englishword/feature/widget/app_bar/home_app_bar.dart';
import 'package:englishword/feature/widget/tab_bar/tab_bar_decorate_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: WordBoardTabType.values.length,
      child: Column(
        children: [
          Stack(
            children: [
              TabBar(
                tabs: [
                  ...WordBoardTabType.values
                      .map((tab) => Tab(text: tab.label))
                      .toList(),
                ],
                indicator: TabBarDecorateView(
                  width: (AppSize.screenWidth - 40) / 3,
                ),
                onTap: (_) {
                  FocusScope.of(context).unfocus();
                },
                overlayColor:
                WidgetStateProperty.all<Color>(Colors.grey.shade200),
                labelColor: AppColor.of.black,
                unselectedLabelColor: AppColor.of.gray3,
                indicatorColor: AppColor.of.black,
                labelStyle: AppTextStyle.title3,
                unselectedLabelStyle: AppTextStyle.body2,
              ),

              /// DIVIDER
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 0.5,
                  color: AppColor.of.gray2,
                  width: double.infinity,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Container(color: Colors.blue),
                Container(color: Colors.green),
                Container(color: Colors.red),
              ],
            ),
          ),

        ],
      ),
    );
  }

  @override
  bool get canPop => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return HomeAppBar(
      actions: [
        BounceTapper(
          onTap: () {},
          child: Image.asset(Assets.myWord, height: 24, width: 24),
        ),
      ],
    );
  }
}
