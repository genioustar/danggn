import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required final User user,
    required final String name,
    required final int price,
    required final String description,
    required final ProductStatus status,
    required final List<String> images,
  }) = _Product;
}
