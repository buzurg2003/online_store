import 'package:flutter/material.dart';
import 'package:online_store/home_page.dart';
import 'package:online_store/widgets/cart_page.dart';
import 'package:online_store/widgets/courses_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shop',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => const HomePage(),
        '/cart/': (context) => const CartPage(),
        '/courses/': (context) => const CoursesPage(),
      },
      initialRoute: '/',
    );
  }
}