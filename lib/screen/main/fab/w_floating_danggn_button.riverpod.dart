import 'package:fast_app_base/screen/main/fab/w_floating_danggn_button.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final floatingButtonStateProvier =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
        (ref) => FloatingButtonStateNotifier(
            const FloatingButtonState(isExpanded: false, isSmall: false)));

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);
  bool needToBtnBigger = false;
  @override
  bool updateShouldNotify(
      FloatingButtonState old, FloatingButtonState current) {
    return super.updateShouldNotify(old, current);
  }

// 기존에 state 에 작업하는거라서 updateShouldNotify에서 변경을 감지를 못해서 위를 무조건 true로 해줘서 항상 바뀐거처럼 작동하게 함.
  void onTapButton() {
    // 초기에 입력받은 값이 무엇인지 저장
    final isExpaed = state.isExpanded;
    final isSmall = state.isSmall;

    state = FloatingButtonState(
        isExpanded: !state.isExpanded, isSmall: needToBtnBigger ? false : true);

    if (needToBtnBigger) {
      needToBtnBigger = false;
    }

    if (!isExpaed && !isSmall) {
      needToBtnBigger = true;
    }
  }

  void changeButtonSize(bool isSmall) {
    state = state.copyWith(isSmall: isSmall);
  }
}
