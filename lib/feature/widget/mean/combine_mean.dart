import 'package:collection/collection.dart';
import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/core/style/app_text_style.dart';
import 'package:flutter/material.dart';

class CombineMean extends StatelessWidget {
  const CombineMean({super.key, required this.means});

  final List<WordMeaningInfo> means;
  @override
  Widget build(BuildContext context) {
    return combineText(means);
  }
}

Widget combineText(List<WordMeaningInfo> means) {
  if (means.isEmpty) const SizedBox.shrink();
  final List<TextSpan> spans = [];

  means.forEachIndexed((index, element) {
    spans.add(
      TextSpan(
        text: element.mean,
        style:
        element.bold == "Y"
            ? AppTextStyle.body3.copyWith(color: AppColor.depthBoldBlue)
            : AppTextStyle.title1.copyWith(color: AppColor.depthBold),
      ),
    );

    if (index != means.length - 1) {
      spans.add(
        TextSpan(
          text: '/',
          style: AppTextStyle.body3.copyWith(color: AppColor.depthBold),
        ),
      );
    }
  });

  return RichText(text: TextSpan(children: spans));
}