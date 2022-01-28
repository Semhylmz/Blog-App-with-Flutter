import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  late String title,
      shortInfo,
      thumbnailUrl,
      longDescription,
      category,
      categoryId,
      id;
  late Timestamp publishedDate;

  DataModel(
      {required this.title,
      required this.shortInfo,
      required this.thumbnailUrl,
      required this.longDescription,
      required this.publishedDate,
      required this.id,
      required this.category,
      required this.categoryId});

  DataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortInfo = json['shortInfo'];
    publishedDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    longDescription = json['longDescription'];
    category = json['category'];
    categoryId = json['categoryId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['shortInfo'] = this.shortInfo;
    if (this.publishedDate != null) {
      data['publishedDate'] = this.publishedDate;
    }
    data['thumbnailUrl'] = this.thumbnailUrl;
    data['longDescription'] = this.longDescription;
    data['category'] = this.category;
    data['categoryId'] = this.categoryId;
    data['id'] = this.id;
    return data;
  }
}

class PublishedDate {
  late String date;

  PublishedDate({required this.date});

  PublishedDate.fromJson(Map<String, dynamic> json) {
    date = json['$date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$date'] = this.date;
    return data;
  }
}
