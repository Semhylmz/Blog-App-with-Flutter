import 'package:ateizm_fikri/config/constants.dart';
import 'package:ateizm_fikri/config/theme_data.dart';
import 'package:ateizm_fikri/views/blog_page.dart';
import 'package:ateizm_fikri/views/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  var _pages = <Widget>[
    BlogPage(),
    CategoriesPage(),
    //SavedPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Provider.of<ThemeColorData>(context).themeColor;
    bool _isLight = Provider.of<ThemeColorData>(context).isLight;

    return Scaffold(
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: _isLight ? kContentColorLightTheme1 : kDarkColor,
          selectedItemColor: _isLight ? kPrimaryColor : Colors.white70,
          unselectedItemColor: Colors.grey.shade500,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              title: Text('Blog'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              title: Text('Kategori'),
            ),
            /*BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_outlined),
              title: Text('Favoriler'),
            )*/
          ],
        ));
  }
}
