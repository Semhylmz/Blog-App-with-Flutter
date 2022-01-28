import 'package:ateizm_fikri/widgets/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  const Temp({Key? key}) : super(key: key);

  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _data = [];
  bool _loadingData = true;
  int _perPage = 10;
  late DocumentSnapshot _lastDocument;
  ScrollController _scrollController = ScrollController();
  bool _gettinMoreData = false;
  bool _moreProductAvaliable = true;

  _getData() async {
    Query query = _firestore.collection("posts").orderBy("id").limit(_perPage);

    setState(() {
      _loadingData = true;
    });

    QuerySnapshot querySnapshot = await query.get();
    _data = querySnapshot.docs;
    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];

    setState(() {
      _loadingData = false;
    });
  }

  _getMoreData() async {
    if (_moreProductAvaliable == false) {
      return;
    }

    if (_gettinMoreData == true) {
      return;
    }

    _gettinMoreData = true;

    Query query = _firestore
        .collection("posts")
        .orderBy("id")
        .startAfter([_lastDocument.data()]).limit(_perPage);

    QuerySnapshot querySnapshot = await query.get();

    if (querySnapshot.docs.length < _perPage) _moreProductAvaliable = false;

    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];

    _data = querySnapshot.docs;

    setState(() {
      _gettinMoreData = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();

    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = -_scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;

      ((maxScroll - currentScroll) < delta) ? _getMoreData() : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loadingData == true
          ? Container(
              child: Center(
                child: ColorLoader(),
              ),
            )
          : Container(
              child: _data.length == 0
                  ? Center(
                      child: Text("Veri Yok!"),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: _data.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return ListTile(
                          leading: CircleAvatar(),
                          title: _data[index].data() as Widget,
                        );
                      },
                    ),
            ),
    );
  }
}
