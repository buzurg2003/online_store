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
          title: Text('Cart'),
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Item 1'),
                    subtitle: Text('This is a notification'),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Item 2'),
                    subtitle: Text('This is a notification'),
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
