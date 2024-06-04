import 'package:flutter/material.dart';
import 'package:online_store/widgets/cart_page.dart';

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
                        label: Text('All'),
                      ),
                      ButtonSegment(
                        value: 'Courses',
                        label: Text('Courses'),
                      ),
                      ButtonSegment(
                        value: 'T-Shirt',
                        label: Text('T-Shirt'),
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
                        Card(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset('images/english_course.jpg'),
                              ),
                              const ListTile(
                                title: Text('English'),
                                subtitle: Text('English course'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FilledButton(
                                    onPressed: () {},
                                    child: const Text('Buy now'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Add to Cart'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (selectedCategory == 'All' || selectedCategory == 'T-Shirt') ...[
                        Card(
                          child: Column(
                            children: [
                              Image.asset("images/t-shirt.jpg"),
                              const ListTile(
                                title: Text('T-Shirt'),
                                subtitle: Text('Adidas T-Shirt'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FilledButton(
                                    onPressed: () {},
                                    child: const Text('Buy now'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Add to Cart'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_sharp),
            label: 'Cart',
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