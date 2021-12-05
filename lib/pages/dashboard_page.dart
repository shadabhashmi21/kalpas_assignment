import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kalpas_assignment/pages/favorites_list_page.dart';
import 'package:kalpas_assignment/pages/news_list_page.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState(0);

    return Scaffold(
      body: _selectedIndex.value == 0
          ? const NewsListPage()
          : const FavoritesListPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favs',
          ),
        ],
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex.value,
        onTap: (index) => _selectedIndex.value = index,
      ),
    );
  }
}
