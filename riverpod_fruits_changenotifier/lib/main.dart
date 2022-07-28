import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

final FavoriteProvider = ChangeNotifierProvider((ref) => Favorites());

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

class Favorites extends ChangeNotifier {
  String fruit = 'unknown';

  void changeFruit(String newFruit) {
    fruit = newFruit;
    notifyListeners();
  }
}
