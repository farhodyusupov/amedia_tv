import 'dart:convert';
import 'package:http/http.dart';
import 'package:amedia_tv/class/data.dart';

class HttpService {
  Future<List<Data>> getData() async {
    Response res = await get(Uri.parse('http://cdn.amediatv.uz/api/category'));
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body);
      List<dynamic> body = map['data'];

      List<Data> posts = body.map((dynamic item) => Data.fromJson(item)).toList();
      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}




