import 'package:ateizm_fikri/config/theme_data.dart';
import 'package:ateizm_fikri/views/category_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "Ahiretin Varlığının Delilleri",
    "Allah'ın Varlığının Delilleri",
    "Evrim Safsatası",
    "Gayeli ve Planlı Yaratılış",
    "Hadisler",
    "İslam'da Adalet",
    "Kader",
    "Kâinat Rehberi",
    "Meleklerin Varlığının Delilleri",
    "Özgürlük Dini",
    "Sen Kimsin",
    "Think It",
    "Use It",
    "Vesvese"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Divider(
                  color: Color(0xFFFE9003),
                  thickness: 5,
                  height: 40,
                ),
                SizedBox(height: 10),
                Flexible(
                  child: ListView(
                    children: categories
                        .map((String title) =>
                            CategoryMenu(title: title, context: context))
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryMenu extends StatelessWidget {
  CategoryMenu({Key? key, required this.title, @required context})
      : super(key: key);

  final String title;
  //final String mTitle = title.toLowerCase();

  @override
  Widget build(BuildContext context) {
    Color _color = Provider.of<ThemeColorData>(context).colorBackground;

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FlatButton(
          color: _color,
          padding: EdgeInsets.all(15),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryBlog(title: title.toLowerCase()),
              ),
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Muli', fontWeight: FontWeight.w700),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 15),
            ],
          ),
        ),
      ),
    );
  }
}
