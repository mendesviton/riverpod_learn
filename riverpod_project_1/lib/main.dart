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

final fruitProvider = StateProvider<String>((ref) => 'unkown');

class MyHomePage extends HookConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fruit = ref.watch(fruitProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha fruta favorita é ${fruit.state}'),
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
          ref.watch(fruitProvider.state).state = fruit;
        },
        child: Text(fruit));
  }
}
