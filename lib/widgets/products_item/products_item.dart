import 'package:flutter/material.dart';
import 'package:online_store/widgets/products_item/products_item_model.dart';

class ProductsItem extends StatelessWidget {
  final Product product;
  final Function(Product) addToCart;

  const ProductsItem({super.key, required this.product, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(product.imagePath),
          ListTile(
            title: Text(product.title),
            subtitle: Text(product.subtitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(
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
                child: const Text('Купить сейчас'),
              ),
              ElevatedButton(
                onPressed: () => addToCart(product),
                child: const Text('Добавить в корзину'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
