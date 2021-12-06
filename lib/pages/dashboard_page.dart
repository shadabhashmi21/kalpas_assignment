import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kalpas_assignment/pages/favorites_list_page.dart';
import 'package:kalpas_assignment/pages/news_list_page.dart';

class DashboardPage extends HookWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = useState(0);
    final _selectedHeartColor = useState(Colors.red);
    final _selectedForegroundColor = useState(Colors.white);
    final _selectedBackgroundColor = useState(Colors.blue);
    final _unselectedBackgroundColor = useState(Colors.white);
    final _unselectedForegroundColor = useState(Colors.black);

    Color _getBgColor(int index) =>
        _selectedIndex.value == index ? _selectedBackgroundColor.value : _unselectedBackgroundColor.value;

    Color _getItemColor(int index) =>
        _selectedIndex.value == index ? _selectedForegroundColor.value : _unselectedForegroundColor.value;

    Widget _buildIcon(IconData iconData, String text, int index) => SizedBox(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      child: Material(
        color: _getBgColor(index),
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData,color: index == 1 ? _selectedHeartColor.value :_getItemColor(index),),
              const SizedBox(width: 10,),
              Text(text,
                  style: TextStyle(color: _getItemColor(index))),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: _selectedIndex.value == 0
          ? const NewsListPage()
          : const FavoritesListPage(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items:  [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.format_list_bulleted, 'News', 0),
              label: ''
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.favorite, 'Favs', 1),
            label: ''
          ),
        ],
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex.value,
        onTap: (index) => _selectedIndex.value = index,
      ),
    );
  }
}
