// UI를 컨트롤 하는 부분을 따로 분리하여 작성
import 'package:freezed_annotation/freezed_annotation.dart';

part 'w_floating_danggn_button.state.freezed.dart';

@freezed
class FloatingButtonState with _$FloatingButtonState {
  const factory FloatingButtonState({
    required bool isExpanded,
    required bool isSmall,
  }) = _FloatingButtonState;
}
