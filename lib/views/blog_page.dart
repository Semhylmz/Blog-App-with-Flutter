import 'package:ateizm_fikri/admin/upload.dart';
import 'package:ateizm_fikri/config/constants.dart';
import 'package:ateizm_fikri/config/theme_data.dart';
import 'package:ateizm_fikri/models/data_model.dart';
import 'package:ateizm_fikri/views/detail_page.dart';
import 'package:ateizm_fikri/widgets/custom_dialog_box.dart';
import 'package:ateizm_fikri/widgets/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

late double width;

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    bool _isLight = Provider
        .of<ThemeColorData>(context)
        .isLight;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isLight ? kPrimaryColor : kContentColorDarkTheme,
        elevation: 0,
        title: Text(
          'Ateizm Fikri',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontFamily: 'Muli',
              fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => CustomDialog());
                // Route route = MaterialPageRoute(builder: (c) => About());
                // Navigator.push(context, route);
              },
              icon: Icon(Icons.more_vert_outlined))
        ],
      ),
      //backgroundColor: _isLight ? Colors.black : Colors.white,
      backgroundColor: Colors.white,
      body: ,

      /*body: CustomScrollView(
        slivers: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .limit(10)
                .orderBy('id', descending: true)
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> dataSnapshot) {
              return !dataSnapshot.hasData
                  ? SliverPadding(
                      sliver: SliverToBoxAdapter(
                        child: ColorLoader(
                          dotOneColor: Colors.white,
                          dotTwoColor: Colors.white,
                          dotThreeColor: Colors.white,
                        ),
                      ),
                      padding: EdgeInsets.all(0),
                    )
                  : SliverPadding(
                      sliver: SliverStaggeredGrid.countBuilder(
                          crossAxisCount: 1,
                          staggeredTileBuilder: (_) => StaggeredTile.fit(1),
                          itemBuilder: (context, index) {
                            DataModel model = DataModel.fromJson(
                                dataSnapshot.data!.docs[index].data()
                                    as Map<String, dynamic>);
                            return sourceInfo(model, context);
                          },
                          itemCount: dataSnapshot.data!.docs.length),
                      padding: EdgeInsets.all(0),
                    );
            },
          ),
        ],
      ),*/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (_) => UploadPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
}

sourceInfo(DataModel model, BuildContext context, {removeFavorite}) {
  bool _isLight = Provider
      .of<ThemeColorData>(context)
      .isLight;

  return InkWell(
    onTap: () {
      Route route =
      MaterialPageRoute(builder: (c) => DetailPage(dataModel: model));
      Navigator.push(context, route);
    },
    onDoubleTap: () {
      //favorite.checkItemInFav(model.id, context);
    },
    onLongPress: () {
      Share.share(model.title +
          "\n" +
          "\n" +
          model.longDescription +
          "\n" +
          "\n" +
          "Ateizm Fikri");
    },
    splashColor: Colors.orange,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.5),
      child: Container(
        color: _isLight ? Colors.white : kContentColorDarkTheme,
        height: 150,
        width: width,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        model.thumbnailUrl,
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            SizedBox(width: 7.0),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.0),
                  Container(
                    child: Text(
                      model.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: _isLight ? Colors.black : Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Muli'),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Column(
                    children: [
                      Text(
                        model.shortInfo,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: TextStyle(
                            color: _isLight ? Colors.black54 : Colors.white60,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(width: 5.0),
                  /*Align(
                    alignment: Alignment.centerRight,
                    child: true
                        ? IconButton(
                            icon: Icon(Icons.bookmark),
                            color: kPrimaryColor,
                            iconSize: 15.0,
                            onPressed: () {
                              //favorite.checkItemInFav(model.id, context);
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              //favorite.checkItemInFav(model.id, context);
                            },
                            icon: Icon(Icons.bookmark),
                            iconSize: 15.0,
                            color: Colors.grey,
                          ),
                  ),*/
                  //Divider(color: Colors.black38),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
