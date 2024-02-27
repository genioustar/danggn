import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingDanggnButton extends ConsumerWidget {
  FloatingDanggnButton({super.key});
  final bool isExpanded = true;
  final duration = 300.ms;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return const Placeholder(); // Placeholder 위젯은 임시로 사용할 때 사용하는 위젯(영역이 어떻게 차지할지 보여주는 위젯)
    return Stack(
      children: [
        AnimatedContainer(
          // 배경을 어둡게 만들기 위한 애니메이션 컨테이너
          duration: duration,
          color:
              isExpanded ? Colors.black.withOpacity(0.4) : Colors.transparent,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: AnimatedContainer(
            duration: duration,
            height: 60,
            decoration: BoxDecoration(
                color: const Color(0xffff791f),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [const Icon(Icons.add), '글쓰기'.text.make()],
            ),
          ).pOnly(
              right: 20,
              bottom: MainScreenState.BottomNavigationBarHeight +
                  context.viewPaddingBottom + // context는 일반적으로 없어서 만들어줘야함
                  10), //pOnly는 padding을 줄 때 사용하는 메서드 바텀뷰 패빙영역과 네비게이션 높이 때문에 변동이 생길수 있어 2개의 크기를 고정!
        ),
      ],
    );
  }
}
