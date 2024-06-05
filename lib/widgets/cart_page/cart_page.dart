import 'package:flutter/material.dart';
import 'package:online_store/widgets/cart_page/cart_page_model.dart';
import 'package:online_store/widgets/products_item/products_item_model.dart';

class CartPage extends StatelessWidget {
  final List<dynamic> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          if (item is Course) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.notifications_sharp),
                  title: Text(item.title),
                  subtitle: Text(item.subtitle),
                  trailing: FilledButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('English'),
                        content: const Text('Курс был куплен'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text('Купить'),
                  ),
                ),
              ),
            );
          } else if (item is Product) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.notifications_sharp),
                  title: Text(item.title),
                  subtitle: Text(item.subtitle),
                  trailing: FilledButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Футболка'),
                        content: const Text('Товар был куплен'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text('Купить'),
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
