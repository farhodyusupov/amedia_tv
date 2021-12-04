import 'dart:convert';
import 'package:http/http.dart';
import 'package:amedia_tv/class/news.dart';
class YangiliklarService{
  Future <List<Yangiliklar>> getNews() async{
    Response res = await get(Uri.parse('http://cdn.amediatv.uz/api/news/all'));
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body.toString());
      List<dynamic> body = map['data'];
      List<Yangiliklar> news = body.map((dynamic item) => Yangiliklar.fromJson(item)).toList();
      return news;
    } else {
      print(res.statusCode);
      throw "Unable to retrieve posts.";
    }
  }

}
