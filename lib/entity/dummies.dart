import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

// picSum을 이용하여 이미지를 가져오는 함수
String picSum(int id) {
  return 'https://picsum.photos/id/$id/200/200';
}

final user1 = User(
  id: 1,
  nickname: '홍길동',
  profilUrl: picSum(1),
  temperature: '36.5',
);

final user2 = User(
  id: 2,
  nickname: '김철수',
  profilUrl: picSum(2),
  temperature: '39.5',
);

final user3 = User(
  id: 3,
  nickname: '이영희',
  profilUrl: picSum(3),
  temperature: '37.5',
);

final product1 = Product(
  user: user1,
  name: '아이폰13',
  price: 1000000,
  description:
      '아이폰13 256GB 실버 색상입니다. 2021년 10월 15일에 구매한 제품으로, 1년간 사용하였습니다. 외관상의 흠집이나 파손은 없으며, 모든 기능이 정상적으로 작동합니다.',
  status: ProductStatus.nomal,
  images: List.generate(5, (index) => picSum(index + 1)),
);

final product2 = Product(
  user: user1,
  name: '스마트 티비',
  price: 500000,
  description:
      'LG 스마트 티비 55인치입니다. 2020년 5월 15일에 구매한 제품으로, 2년간 사용하였습니다. 외관상의 흠집이나 파손은 없으며, 모든 기능이 정상적으로 작동합니다.',
  status: ProductStatus.nomal,
  images: List.generate(5, (index) => picSum(index + 5)),
);

final post1 = ProductPost(
  user: product1.user,
  product: product1,
  content: '글의 내용입니다',
  address: const Address(fullAddress: '서울시 독산동', simpleAddress: '다트시'),
  chatCount: 5,
  likeCount: 3,
  createdAt: DateTime.now().subtract(5.minutes),
);

final post2 = ProductPost(
  user: product2.user,
  product: product2,
  content: '글의 내용입니다',
  address: const Address(fullAddress: '서울시 관악구', simpleAddress: '다트시'),
  chatCount: 30,
  likeCount: 301,
  createdAt: DateTime.now().subtract(10.minutes),
);

final postList = [post1, post2, post1, post2, post1, post2];
