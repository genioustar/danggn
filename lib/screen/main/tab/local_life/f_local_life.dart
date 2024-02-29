import 'package:fast_app_base/screen/main/fab/w_floating_danggn_button.riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalLifeFragment extends ConsumerStatefulWidget {
  const LocalLifeFragment({super.key});

  @override
  ConsumerState<LocalLifeFragment> createState() => _LocalLifeFragmentState();
}

class _LocalLifeFragmentState extends ConsumerState<LocalLifeFragment> {
  final scrollController = ScrollController();

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
    return ListView(controller: scrollController, children: [
      Container(height: 500, color: Colors.orange),
      Container(height: 500, color: Colors.blue),
      Container(height: 500, color: Colors.red),
      Container(height: 500, color: Colors.blue),
    ]);
  }
}
