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
      slivers: <Widget> [
        const SliverAppBar(
          title: Text('Корзина'),
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return CartItemRow(
                indexInList: index,
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}

class CartItemRow extends StatelessWidget {
  final int indexInList;

  const CartItemRow({
    super.key,
    required this.indexInList
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
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
    );
  }
}