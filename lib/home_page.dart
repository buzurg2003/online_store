import 'package:flutter/material.dart';
import 'package:online_store/widgets/cart_page/cart_page.dart';
import 'package:online_store/widgets/course_item/course_item.dart';
import 'package:online_store/widgets/products_item/products_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: <Widget>[
          /// Home page
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: const Text('Online Store'),
                pinned: true,
                floating: true,
                snap: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48.0),
                  child: SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                        value: 'All',
                        label: Text('Все'),
                      ),
                      ButtonSegment(
                        value: 'Courses',
                        label: Text('Курсы'),
                      ),
                      ButtonSegment(
                        value: 'T-Shirt',
                        label: Text('Продукты'),
                      ),
                    ],
                    selected: {selectedCategory},
                    onSelectionChanged: (newSelection) {
                      setState(() {
                        selectedCategory = newSelection.first;
                      });
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (selectedCategory == 'All' || selectedCategory == 'Courses') ... [
                        CourseItem(),
                      ],
                      if (selectedCategory == 'All' || selectedCategory == 'T-Shirt') ... [
                        ProductsItem(),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// Cart page
          CartPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_sharp),
            label: 'Корзина',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}