import 'package:flutter/material.dart';
import 'package:flutter_notifier/app/presenter/home/widgets/frui_button.dart';
import 'home_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';

final FavoriteProvider = ChangeNotifierProvider(
  (ref) => FavoritesController(),
);

class MyHomePage extends HookConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(FavoriteProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha fruta favorita é ${favorite.fruit}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            FruitButton('Maracujá'),
            FruitButton('Maça'),
            FruitButton('Laranja'),
            FruitButton('Morango'),
            FruitButton('Melancia'),
            FruitButton('Banana'),
            FruitButton('Caqui'),
            FruitButton('Banana'),
          ],
        ),
      ),
    );
  }
}
