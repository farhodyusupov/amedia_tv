import 'dart:convert';
import 'package:http/http.dart';
import 'package:amedia_tv/class/slider.dart';
class SliderService{
  Future <List<SliderImage>> getSlider() async{
    Response res = await get(Uri.parse('http://cdn.amediatv.uz/api/home'));
    if (res.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(res.body.toString());
      List<dynamic> body = map['sliders'];
      List<SliderImage> slider = body.map((dynamic item) => SliderImage.fromJson(item)).toList();
      return slider;
    } else {
      print(res.statusCode);
      throw "Unable to retrieve posts.";
    }
  }

}
