import 'package:ateizm_fikri/config/theme_data.dart';
import 'package:ateizm_fikri/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class DetailPage extends StatefulWidget {
  final DataModel dataModel;

  DetailPage({required this.dataModel});

  @override
  _DetailPageState createState() => _DetailPageState(dataModel.id);
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState(String id);


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool _isLight = Provider.of<ThemeColorData>(context).isLight;

    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                expandedHeight: 400.0,
                floating: false,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Image.network(
                    widget.dataModel.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,
                        color: _isLight ? Colors.black : Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                actions: [
                  //mButton(model: widget.dataModel),
                  IconButton(
                    icon: Icon(Icons.share_outlined,
                        color: _isLight ? Colors.black : Colors.white),
                    onPressed: () {
                      Share.share(widget.dataModel.title +
                          "\n" +
                          "\n" +
                          widget.dataModel.longDescription +
                          "\n" +
                          "\n" +
                          "Ateizm Fikri");
                    },
                  ),
                ],
              ),
            ];
          },
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7),
                  Align(
                    child: Container(
                      width: 100,
                      height: 2,
                      decoration: BoxDecoration(
                        color: _isLight ? Colors.black38 : Colors.white54,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SelectableText(
                    widget.dataModel.title,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontFamily: 'Muli', fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  SelectableText(
                    widget.dataModel.longDescription,
                    style: TextStyle(
                        height: 1.3,
                        fontSize: 18,
                        fontFamily: 'Muli',
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
class mButton extends StatelessWidget {
  final DataModel model;

  const mButton({required Key key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: isInFav
          ? true
          : (){
        var fav = context.read<FavoriModel>();
        isInFav = context.select<FavoriModel, bool>((value) => value.items.contains(model));
        fav.add(model);
      },
      child: isInFav
          ? Icon(Icons.check, semanticLabel: "Added",)
          : Text("Add"),
    );
  }
}*/
