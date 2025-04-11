import 'package:englishword/core/database/domain/deep_word_with_words.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:englishword/feature/pages/depth/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteIconButton extends ConsumerWidget {
  const FavoriteIconButton({
    super.key,
    this.size = 24,
    required this.model,
  });


  final DeepWordInfo model;
  final double size;




  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isLiked = ref.watch(favoriteProviderProvider).contains(model);



    return GestureDetector(
      onTap: () {
        ref.watch(favoriteProviderProvider.notifier).toggleFavorite(model);
      },
      child: AnimatedCrossFade(
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        firstChild: Icon(
          Icons.favorite,
          color: AppColor.favoriteSelected,
          size: size,
        ),
        secondChild: Icon(
          Icons.favorite_outline,
          color: AppColor.favoriteUnSelected,
          size: size,
        ),
        crossFadeState:
        isLiked ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}