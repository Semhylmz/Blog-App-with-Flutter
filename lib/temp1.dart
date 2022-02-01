
final ScrollController _scrollController = ScrollController();
List<String> items = [];
bool loading = false, allLoaded = false;

mockFetch() async {
  if (allLoaded) return;

  setState(() {
    loading = true;
  });

  await Future.delayed(Duration(milliseconds: 500));
  List<String> newData = items.length >= 60
  ? []
  : List.generate(20, (index) => "List item ${index + items.length}");
  if (newData.isNotEmpty) {
  items.addAll(newData);
  }
  setState(() {
  loading = false;
  allLoaded = newData.isEmpty;
  });
}

@override
void initState() {
  super.initState();
  mockFetch();
  _scrollController.addListener(() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent &&
        !loading) {
      print("New data call!");
      mockFetch();
    }
  });
}

@override
void dispose() {
  super.dispose();
  _scrollController.dispose();
}

@override
Widget build(BuildContext context) {
  width = MediaQuery.of(context).size.width;
  bool _isLight = Provider.of<ThemeColorData>(context).isLight;

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
  body: LayoutBuilder(
  builder: (context, constraints) {
  if (items.isNotEmpty) {
  return Stack(children: [
  ListView.separated(
  controller: _scrollController,
  itemBuilder: (context, index) {
  if (index < items.length) {
  return ListTile(
  title: Text(
  items[index],
  ),
  );
  } else {
  return Container(
  width: constraints.maxWidth,
  height: 50,
  child: Text("Nothing more to Load!"),
  );
  }
  },
  separatorBuilder: (context, index) {
  return Divider(height: 1);
  },
  itemCount: items.length + (allLoaded ? 1 : 0)),
  if (loading) ...[
  Positioned(
  left: 0,
  bottom: 0,
  child: Container(
  width: constraints.maxWidth,
  height: 80,
  child: Center(
  child: CircularProgressIndicator(),
  ),
  ),
  ),
  ]
  ]);
  } else {
  Container(
  child: Center(
  child: ColorLoader(),
  ),
  );
  }
  },
  ),
