import 'package:flutter/material.dart';
import 'package:online_store/widgets/cart_page/cart_page_model.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final Function(Course) addToCart;

  const CourseItem({
    super.key,
    required this.course,
    required this.addToCart
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(course.imagePath),
          ),
          ListTile(
            title: Text(course.title),
            subtitle: Text(course.subtitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(
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
                child: const Text('Купить сейчас'),
              ),
              ElevatedButton(
                onPressed: () => addToCart(course),
                child: const Text('Добавить в корзину'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
