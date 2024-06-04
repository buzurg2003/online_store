import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset('images/english_course.jpg'),
          ),
          const ListTile(
            title: Text('English'),
            subtitle: Text('Курс английского языка'),
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
