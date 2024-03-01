import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required final int id,
    required final String nickname,
    required final String profilUrl,
    required final String temperature,
  }) = _User;
}
