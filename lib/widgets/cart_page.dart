import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          title: Text('Корзина'),
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.notifications_sharp),
                    title: const Text('English'),
                    subtitle: const Text('Курс английского языка'),
                    trailing: FilledButton(
                      onPressed: () {},
                      child: const Text('Купить'),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.notifications_sharp),
                    title: const Text('Футболка'),
                    subtitle: const Text('Футболка Adidas'),
                    trailing: FilledButton(
                      onPressed: () {},
                      child: const Text('Купить'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
