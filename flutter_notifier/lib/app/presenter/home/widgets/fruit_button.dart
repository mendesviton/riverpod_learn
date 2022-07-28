import 'package:flutter/material.dart';
import 'package:flutter_notifier/app/presenter/home/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FruitButton extends HookConsumerWidget {
  const FruitButton(
    this.fruit, {
    Key? key,
  });

  final String fruit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          ref.watch(FavoriteProvider).changeFruit(fruit);
        },
        child: Text(fruit));
  }
}
