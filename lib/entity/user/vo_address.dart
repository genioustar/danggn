import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_address.freezed.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required final String fullAddress,
    required final String simpleAddress,
  }) = _Address;
}
