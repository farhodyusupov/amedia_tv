import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/images/vizuvel.png',
  'assets/images/vizuvel.png',
  'assets/images/vizuvel.png',
  'assets/images/vizuvel.png',
];
int _currentIndex = 0;

class CarouselWidget extends StatefulWidget {
  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imgList.map((imgUrl) {
              return Builder(builder: (BuildContext context){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  child: Image.asset(imgUrl),
                );
              },);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
