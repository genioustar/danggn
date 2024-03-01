import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_product_post.freezed.dart';

@freezed
class ProductPost with _$ProductPost {
  const factory ProductPost({
    required final User user,
    required final Product product,
    required final String content,
    required final Address address,
    required final int chatCount,
    required final int likeCount,
    required final DateTime createdAt,
  }) = _ProductPost;
}
