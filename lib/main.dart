import 'package:flutter/material.dart';
import 'package:online_store/home_page.dart';
import 'package:online_store/widgets/cart_page/cart_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<dynamic> _cartItems = [];

  void _addToCart(dynamic item) {
    setState(() {
      _cartItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shop',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => HomePage(
          addToCart: _addToCart,
          cartItems: _cartItems,
        ),
        '/cart/': (context) => CartPage(cartItems: _cartItems),
      },
      initialRoute: '/',
    );
  }
}
