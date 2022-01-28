import 'package:ateizm_fikri/widgets/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage>
    with AutomaticKeepAliveClientMixin<UploadPage> {
  bool get wantKeepAlive => true;

  var _idController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _textController = TextEditingController();
  TextEditingController _categoryIdController = TextEditingController();
  String postId = DateTime.now().millisecondsSinceEpoch.toString();
  bool uploading = false;

  File? _imageFile;
  final ImagePicker _imagePicker = ImagePicker();

  String _categoryValue = "ahiretin varlığının delilleri";

  List<String> spinnerCategories = [
    "ahiretin varlığının delilleri",
    "allah'ın varlığının delilleri",
    "evrim safsatası",
    "gayeli ve planlı yaratılış",
    "hadisler",
    "islam'da adalet",
    "kader",
    "kâinat rehberi",
    "meleklerin varlığının delilleri",
    "özgürlük dini",
    "sen kimsin",
    "think ıt",
    "use ıt",
    "vesvese"
  ];

  Future pickPhotoFromGallery() async {
    final imageFile = (await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 25));

    setState(() {
      //_imageFile = imageFile;
      if (imageFile != null)
        _imageFile = File(imageFile.path);
      else
        print('resim seçilmedi!');
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _idController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _textController.dispose();
    _categoryIdController.dispose();
    super.dispose();
  }

  clearFormInfo() {
    setState(() {
      _imageFile = null;
      //_titleController.clear();
      //_descriptionController.clear();
      //_textController.clear();
    });
  }

  uploadImageAndSaveItemInfo() async {
    setState(() {
      uploading = true;
    });

    String imageDownloadUrl = await uploadItemImage(_imageFile);

    saveItemInfo(imageDownloadUrl);
    saveItemInfoCategory(imageDownloadUrl);
  }

  Future<String> uploadItemImage(mFileImage) async {
    final Reference storageReference =
        FirebaseStorage.instance.ref().child("thumbnail");

    UploadTask uploadTask = storageReference
        .child(_idController.text.trim() + ".png")
        .putFile(mFileImage);

    String downloadUrl = await (await uploadTask).ref.getDownloadURL();
    return downloadUrl;
  }

  saveItemInfo(String downloadUrl) {
    final itemsRef = FirebaseFirestore.instance.collection("posts");
    itemsRef.doc(_idController.text.trim()).set({
      "id": _idController.text.trim(),
      "category": _categoryValue.trim(),
      "categoryId": _categoryIdController.text.trim(),
      "title": _titleController.text.trim(),
      "shortInfo": _descriptionController.text.trim(),
      "longDescription": _textController.text.trim(),
      "publishedDate": DateTime.now(),
      "thumbnailUrl": downloadUrl,
    });
  }

  saveItemInfoCategory(String downloadUrl) {
    final itemsRef = FirebaseFirestore.instance.collection(_categoryValue);
    itemsRef.doc(_categoryIdController.text.trim()).set({
      "id": _idController.text.trim(),
      "category": _categoryValue.trim(),
      "categoryId": _categoryIdController.text.trim(),
      "title": _titleController.text.trim(),
      "shortInfo": _descriptionController.text.trim(),
      "longDescription": _textController.text.trim(),
      "publishedDate": DateTime.now(),
      "thumbnailUrl": downloadUrl,
    });
    setState(() {
      _imageFile = null;
      uploading = false;
      postId = DateTime.now().millisecondsSinceEpoch.toString();
      clearFormInfo();

      _categoryIdController.clear();
      _descriptionController.clear();
      _idController.clear();
      _textController.clear();
      _titleController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

  Scaffold buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        splashColor: Colors.black,
        child: Icon(Icons.save_outlined),
        onPressed: uploading ? null : () => uploadImageAndSaveItemInfo(),
      ),
      body: ListView(
        children: [
          Container(height: 20.0, color: Colors.transparent),
          uploading
              ? linearProgress()
              : Center(
                  child: Text(
                    "KAYIT EDİLMEDİ!",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
          /*Container(
          height: 10,
          decoration: BoxDecoration(),
        ),*/
          /*Container(
          color: Colors.red,
          height: 200.0,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: GestureDetector(
                onTap: () => pickPhotoFromGallery(),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: (_imageFile != null)
                            ? FileImage(_imageFile)
                            : FileImage(_imageFile),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        ),*/
          Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => pickPhotoFromGallery(),
                  child: CircleAvatar(
                    radius: 70,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          Divider(color: Colors.orangeAccent),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: DropdownButton<String>(
                  value: _categoryValue,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  underline: Container(
                    height: 1,
                    color: Colors.orangeAccent,
                  ),
                  onChanged: (_data) {
                    setState(() {
                      _categoryValue = _data!;
                    });
                  },
                  items: spinnerCategories
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                child: Expanded(
                  child: ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.black),
                    title: Container(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.black),
                        controller: _categoryIdController,
                        decoration: InputDecoration(
                            hintText: "Kategori Id..",
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.black),
            title: Container(
              width: 200.0,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                controller: _idController,
                decoration: InputDecoration(
                    hintText: "Yazı Id..",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(color: Colors.orangeAccent),
          ListTile(
            leading: Icon(Icons.title, color: Colors.black),
            title: Container(
              width: 200.0,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: _titleController,
                decoration: InputDecoration(
                    hintText: "Başlık..",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(color: Colors.orangeAccent),
          ListTile(
            leading: Icon(Icons.description_outlined, color: Colors.black),
            title: Container(
              width: 200.0,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(color: Colors.black),
                controller: _descriptionController,
                decoration: InputDecoration(
                    hintText: "Kısa Açıklama..",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(color: Colors.orangeAccent),
          ListTile(
            leading: Icon(Icons.text_fields_outlined, color: Colors.black),
            title: Container(
              height: 400.0,
              width: 400.0,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(color: Colors.black),
                controller: _textController,
                decoration: InputDecoration(
                    hintText: "Metin..",
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(color: Colors.orangeAccent),
        ],
      ),
    );
  }
}
