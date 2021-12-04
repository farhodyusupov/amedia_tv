import 'package:amedia_tv/class/slider.dart';

class Yangiliklar{
  final String id;
  final String date;
  NameYangilik nameYangilik;

  Yangiliklar({required this.id, required this.date, required this.nameYangilik});

  factory Yangiliklar.fromJson(Map<String, dynamic> json){
    return Yangiliklar(id: json['_id'], date: json['date'], nameYangilik: NameYangilik.fromJson(json['name']));
  }

}

class NameYangilik{
  final String uz;
  final String ru;

  NameYangilik({required this.ru, required this.uz});
  factory NameYangilik.fromJson(Map<String, dynamic> json){
    return NameYangilik(ru: json['ru'], uz: json['uz']);
  }
}