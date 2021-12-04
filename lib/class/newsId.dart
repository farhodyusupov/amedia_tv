// To parse this JSON data, do
//
//     final newId = newIdFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NewsId newIdFromJson(String str) => NewsId.fromJson(json.decode(str));

String newIdToJson(NewsId data) => json.encode(data.toJson());

class NewsId {
  NewsId({
    required this.success,
    required this.data,
  });

  bool success;
  Data1 data;

  factory NewsId.fromJson(Map<String, dynamic> json) => NewsId(
    success: json["success"],
    data: Data1.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data1 {
  Data1({
    required this.name,
    required this.description,
    required this.videoLink,
    required this.date,
    required this.status,
    required this.id,
    required this.slug,
    required this.image,
    required this.v,
  });

  Description name;
  Description description;
  String videoLink;
  DateTime date;
  bool status;
  String id;
  String slug;
  String image;
  int v;

  factory Data1.fromJson(Map<String, dynamic> json) => Data1(
    name: Description.fromJson(json["name"]),
    description: Description.fromJson(json["description"]),
    videoLink: json["videoLink"],
    date: DateTime.parse(json["date"]),
    status: json["status"],
    id: json["_id"],
    slug: json["slug"],
    image: json["image"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "description": description.toJson(),
    "videoLink": videoLink,
    "date": date.toIso8601String(),
    "status": status,
    "_id": id,
    "slug": slug,
    "image": image,
    "__v": v,
  };
}

class Description {
  Description({
    required this.uz,
    required this.ru,
  });

  String uz;
  String ru;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    uz: json["uz"],
    ru: json["ru"],
  );

  Map<String, dynamic> toJson() => {
    "uz": uz,
    "ru": ru,
  };
}
