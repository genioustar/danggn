import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/animated_width_collapse.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_danggn_button.riverpod.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingDanggnButton extends ConsumerWidget {
  static const height = 200.0;

  FloatingDanggnButton({super.key});
  final duration = 300.ms;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return const Placeholder(); // Placeholder 위젯은 임시로 사용할 때 사용하는 위젯(영역이 어떻게 차지할지 보여주는 위젯)
    final flatingButtonState = ref.watch(floatingButtonStateProvier);
    final isExpanded = flatingButtonState.isExpanded;
    final isSmall = flatingButtonState.isSmall;
    return Stack(
      children: [
        IgnorePointer(
          // Stack의 밑에 깔린 화면(살짝 어둡게 해주는화면)을 눌러도 작동하지 않게 하는 위젯
          ignoring: !isExpanded,
          child: AnimatedContainer(
            // 배경을 어둡게 만들기 위한 애니메이션 컨테이너
            duration: duration,
            color:
                isExpanded ? Colors.black.withOpacity(0.7) : Colors.transparent,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedOpacity(
                opacity: isExpanded ? 1 : 0,
                duration: duration,
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(right: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: context.appColors.floatingActionLayer,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _floatItem('알바', '$basePath/fab/fab_01.png'),
                      _floatItem('과외/클래스', '$basePath/fab/fab_02.png'),
                      _floatItem('농수산물', '$basePath/fab/fab_03.png'),
                      _floatItem('부동산', '$basePath/fab/fab_04.png'),
                      _floatItem('중고차', '$basePath/fab/fab_05.png'),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final currentTab = ref.read(currentTabProvider);
                  debugPrint('currentTab: ${currentTab.tabName}');
                  ref.read(floatingButtonStateProvier.notifier).toggleMenu();
                },
                child: AnimatedContainer(
                  duration: duration,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  decoration: BoxDecoration(
                      color: isExpanded
                          ? context.appColors.floatingActionLayer
                          : const Color(0xffff791f),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedRotation(
                          turns: isExpanded ? 0.125 : 0,
                          duration: duration,
                          child: const Icon(Icons.add)),
                      // if (isSmall) '글쓰기'.text.make()
                      AnimatedWidthCollapse(
                          visible: !isSmall,
                          duration: duration,
                          child: '글쓰기'.text.make())
                    ],
                  ),
                ).pOnly(
                    right: 20,
                    bottom: MainScreenState.BottomNavigationBarHeight +
                        // context.viewPaddingBottom + // context는 일반적으로 없어서 만들어줘야함
                        30),
              ),
            ],
          ), //pOnly는 padding을 줄 때 사용하는 메서드 바텀뷰 패빙영역과 네비게이션 높이 때문에 변동이 생길수 있어 2개의 크기를 고정!
        ),
      ],
    );
  }

  _floatItem(String title, String imagePath) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imagePath, width: 30),
        const Width(8),
        title.text.make()
      ],
    );
  }
}
