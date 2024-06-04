import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset("images/t-shirt.jpg"),
          const ListTile(
            title: Text('Футболка'),
            subtitle: Text('Футболка Adidas'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(
                onPressed: () {},
                child: const Text('Купить сейчас'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Добавить в корзину'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
