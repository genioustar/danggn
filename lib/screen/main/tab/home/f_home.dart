import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_danggn_button.dart';
import 'package:fast_app_base/screen/main/fab/w_floating_danggn_button.riverpod.dart';
import 'package:fast_app_base/screen/main/tab/home/w_product_post_item.dart';
import 'package:fast_app_base/screen/notification/s_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  final scrollController =
      ScrollController(); // 특정 위젯 안에서만 쓰는거면 굳이 riverpod로 안해도 됨
  String title = "월계동";

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      final floatingState = ref.read(floatingButtonStateProvier);
      if (scrollController.offset > 100 && !floatingState.isSmall) {
        ref.read(floatingButtonStateProvier.notifier).changeButtonSize(true);
      } else if (scrollController.offset < 100 && floatingState.isSmall) {
        ref.read(floatingButtonStateProvier.notifier).changeButtonSize(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                title = value;
              });
            },
            itemBuilder: (BuildContext context) => ['월계동', '서초동']
                .map((e) => PopupMenuItem(value: e, child: Text(e)))
                .toList(),
            child: title.text.make(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded),
              onPressed: () {
                Nav.push(const NotificationScreen());
              },
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: FloatingDanggnButton.height),
            controller: scrollController,
            itemBuilder: (context, index) => ProductPostItem(postList[index]),
            itemCount: postList.length,
            separatorBuilder: (context, index) =>
                const Divider().pSymmetric(h: 15),
          ),
        ),
      ],
    );
  }
}
