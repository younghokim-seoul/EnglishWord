import 'package:englishword/core/logger/app_logger.dart';
import 'package:englishword/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BasePage extends HookConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 페이지의 초기화 및 해제를 처리
    useEffect(
          () {
        onInit(ref);
        return () => onDispose(ref);
      },
      [],
    );
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        onWillPop(ref);
      },
      child: ProviderScope(
        overrides: argProviderOverrides != null ? [argProviderOverrides!] : [],
        child: HookConsumer(
          builder: (context, ref, chid) {
            return GestureDetector(
              onTap: () {
                if (!preventAutoUnfocus) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: Container(
                color: AppColor.of.white,
                child:
                    wrapWithSafeArea
                        ? SafeArea(child: _buildScaffold(context, ref))
                        : _buildScaffold(context, ref),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildScaffold(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context, ref),
      body: buildPage(context, ref),
      backgroundColor: screenBackgroundColor,
    );
  }

  /// 라우팅 Argument Provider overrides
  Override? get argProviderOverrides => null;

  /// 키보드가 화면 하단에 올라왔을 때 페이지의 크기를 조정하는 여부를 설정
  @protected
  bool get resizeToAvoidBottomInset => true;

  /// Swipe Back 제스처 동작을 막는지 여부를 설정
  @protected
  bool get canPop => true;

  /// 화면 클릭 시 자동으로 포커스를 해제할지 여부를 설정
  @protected
  bool get preventAutoUnfocus => false;

  /// 화면의 배경색을 설정
  @protected
  Color? get screenBackgroundColor => AppColor.of.white;

  /// SafeArea로 감싸는 여부를 설정
  @protected
  bool get wrapWithSafeArea => true;

  /// 페이지 초기화 시 호출
  @protected
  void onInit(WidgetRef ref) {}

  /// 페이지 해제 시 호출
  @protected
  void onDispose(WidgetRef ref) {}

  /// will pop시
  @protected
  void onWillPop(WidgetRef ref) {}

  /// 화면 페이지의 본문을 구성하는 위젯을 반환
  @protected
  Widget buildPage(BuildContext context, WidgetRef ref);

  /// 화면 상단에 표시될 앱 바를 구성하는 위젯을 반환
  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) => null;
}
