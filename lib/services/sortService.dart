import 'dart:convert';
import 'package:http/http.dart';
import 'package:amedia_tv/class/sort.dart';
class SortService{
  Future <List<Sort>> getSort() async{
    Response res = await get(Uri.parse('http://cdn.amediatv.uz/api/kino/sort'));
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body.toString());
      List<dynamic> body = map['data'];
      List<Sort> sort = body.map((dynamic item) => Sort.fromJson(item)).toList();
      return sort;
    } else {
      print(res.statusCode);
      throw "Unable to retrieve posts.";
    }
  }

}
