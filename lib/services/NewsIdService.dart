import 'dart:convert';
import 'package:http/http.dart';
import 'package:amedia_tv/class/newsId.dart';
class NewsIdService{
  Future <NewsId> getNewsFromId(String id) async{
    final response = await get(Uri.parse('http://cdn.amediatv.uz/api/news/' + id));

    if (response.statusCode == 200) {
      return NewsId.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

}
