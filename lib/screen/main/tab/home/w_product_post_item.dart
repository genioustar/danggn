import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeago/timeago.dart' as timeago; // 몇분전, 몇시간전 등을 표시해주는 패키지

class ProductPostItem extends StatelessWidget {
  final ProductPost post;

  const ProductPostItem(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              // 둥글게 만들고 싶다면 ㄱㄱ
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: post.product.images[0],
                width: 150,
              ),
            ),
            const Width(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  post.content.text.size(17).make(),
                  Row(
                    children: [
                      post.address.simpleAddress.text
                          .size(15)
                          .color(context.appColors.lessImportant)
                          .make(),
                      '*'.text.color(context.appColors.lessImportant).make(),
                      timeago
                          .format(post.createdAt, locale: 'ko')
                          .text
                          .size(15)
                          .color(context.appColors.lessImportant)
                          .make(),
                    ],
                  ),
                  post.product.price.toWon().text.bold.make(),
                ],
              ),
            ),
          ],
        ).p(15),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('$basePath/home/post_chat_count.png', width: 30),
                post.chatCount.toString().text.size(15).make(),
                Image.asset('$basePath/home/post_heart_off.png', width: 30),
                post.likeCount.toString().text.size(15).make(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
