import 'package:freezed_annotation/freezed_annotation.dart';

part 'w_floating_danggn_button.state.freezed.dart';

@freezed
class FloatingButtonState with _$FloatingButtonState {
  const factory FloatingButtonState({
    required bool isExpanded,
    required bool isSmall,
  }) = _FloatingButtonState;
}
