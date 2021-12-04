import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class ClickPostPage extends StatefulWidget {
  final String id;

  const ClickPostPage({Key? key, required this.id}) : super(key: key);

  @override
  _ClickPostPageState createState() => _ClickPostPageState();
}

class _ClickPostPageState extends State<ClickPostPage> {
  TextEditingController izoxController = new TextEditingController();
  final _scrollController = ScrollController();
  var isProfile = false;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://protonvideo.to/iframe/5829388e8f72af7885c42f72fbbac9e4/')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(37, 40, 49, 1),
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                if (isProfile) {
                } else {
                  _profile();
                  print(isProfile);
                }
              },
              icon: Image.asset("assets/icons/person.png"),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
              width: 30,
            ),
            Image.asset("assets/icons/amediaIcon.png"),
            SizedBox(
              width: 40,
            ),
            Container(
              width: 40,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "UZ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            Container(
              width: 1,
              height: 23,
              // height: double.maxFinite,
              color: Colors.grey,
            ),
            Container(
              width: 40,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "RU",
                  style: TextStyle(fontSize: 18, color: Color.fromRGBO(180, 180, 180, 1)),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black87,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/clickPostImage.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/icons/ico-info.png",
                    ),
                    top: 21,
                    left: 29,
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/icons/Settings.png",
                    ),
                    top: 30,
                    right: 45,
                  ),
                  Positioned(
                    child: Center(
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                          : Container(),
                    ),
                      // child: Image.asset("assets/icons/play.fill.png"),
                    ),
                    // left: 34,
                    // bottom: 14,
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),

                  Positioned(
                    child: Image.asset("assets/icons/playerTimeline.png"),
                    left: 54,
                    bottom: 14,
                  ),
                  Positioned(
                    child: Image.asset(
                      "assets/icons/zoom.png",
                    ),
                    right: 42,
                    bottom: 14,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromRGBO(37, 40, 49, 1),
                      ),
                      height: 38,
                      width: 126,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "1-qism",
                            style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins"),
                          ),
                          Image.asset("assets/icons/carbon_view.png")
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromRGBO(37, 40, 49, 1),
                      ),
                      height: 38,
                      width: 126,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "2-qism",
                            style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins"),
                          ),
                          Image.asset("assets/icons/carbon_view.png")
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromRGBO(37, 40, 49, 1),
                      ),
                      height: 38,
                      width: 126,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "3-qism",
                            style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins"),
                          ),
                          Image.asset("assets/icons/carbon_view.png")
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              FlatButton(
                height: 38,
                onPressed: () {},
                color: Color.fromRGBO(242, 152, 36, 1),
                child: Text(
                  "Yuklab olish",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Poppins"),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromRGBO(37, 40, 49, 1),
                ),
                height: 312,
                width: 360,
                child: Container(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Vizuvel",
                            style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Poppins"),
                            textAlign: TextAlign.start,
                          )),
                      Row(
                        children: [
                          Image.asset("assets/icons/flag.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Mamlakat:   Yaponiya",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/icons/person_smal.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Rejissor:   Mitsunaki Susumu",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/icons/studiya.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Studiya:   Production I.G",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/icons/filter.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Janri:   Komediya",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/icons/list 1.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Kategoriya:   Hamma animelar/Ongoing",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Image.asset("assets/icons/clock.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Yil:   2020",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 30, left: 22),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Filmdan kadrlar",
                    style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: "Poppins"),
                  )),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 200,
                      child: Image.asset("assets/images/kadr_1.png"),
                    ),
                    Container(
                      width: 200,
                      child: Image.asset("assets/images/kadr_2.png"),
                    ),
                    Container(
                      width: 200,
                      child: Image.asset("assets/images/kadr_2.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/Ellipse 26.png"),
                  Icon(
                    Icons.radio_button_off,
                    color: Colors.amber,
                    size: 12,
                  ),
                  Icon(
                    Icons.radio_button_off,
                    color: Colors.amber,
                    size: 12,
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.all(22),
                height: 306,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(37, 40, 49, 1),
                ),
                child: Text(
                  "Televidenieda milliy musobaqa o’yinini tasodifan ko’rgan o’rta maktab o’quvchisi  Shyo Xinata, bundan keyin voleybolga  qiziqipketti. Xinata o’zining kichik bo’yligiga  qaramasdan o’zining “kichik giganti” nomi  bilan televizorda ko’rgan mashhur voleybolchu kabi bo’lishga qaror qildi.  bundan keyin Hinata maktabda voleybol  klubini yaratadi, u erda mustaqil amaliyotini  boshlidi. Qatnashchilarning etishmasligi  sababli klubga aylanadi, ammo kegin yili  o’rta maktabda yana beshta odam ishtirok  etib, Xinata voleybol jamoasi tuzish va  turnirga borishga qaror qiladi.",
                  style: TextStyle(color: Colors.white, fontSize: 13, fontFamily: "Poppins"),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 76, left: 26, bottom: 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Ijodkorlar",
                    style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 24),
                  )),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 12, bottom: 8),
                      height: 96,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(37, 40, 49, 1),
                      ),
                      child: Column(
                        children: [
                          Image.asset("assets/images/Sonotoki.png"),
                          Text(
                            "Sonotoki",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12, bottom: 8),
                      height: 96,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(37, 40, 49, 1),
                      ),
                      child: Column(
                        children: [
                          Image.asset("assets/images/Sonotoki.png"),
                          Text(
                            "Sonotoki",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12, bottom: 8),
                      height: 96,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(37, 40, 49, 1),
                      ),
                      child: Column(
                        children: [
                          Image.asset("assets/images/Sonotoki.png"),
                          Text(
                            "Sonotoki",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12, bottom: 8),
                      height: 96,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(37, 40, 49, 1),
                      ),
                      child: Column(
                        children: [
                          Image.asset("assets/images/Sonotoki.png"),
                          Text(
                            "Sonotoki",
                            style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Izox qoldirish",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "Poppins"),
                  )),
              Container(
                height: 250,
                width: 370,
                child: TextField(
                  controller: izoxController,
                  maxLines: 15,
                  decoration: InputDecoration(
                    labelText: "Izoh qoldiring",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(37, 40, 49, 1), width: 0),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromRGBO(37, 40, 49, 1), width: 0.0),
                    ),
                    hoverColor: Color.fromRGBO(37, 40, 49, 1),
                    fillColor: Color.fromRGBO(37, 40, 49, 1),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 38,
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color.fromRGBO(242, 152, 36, 1),
                    ),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Jo`natish",
                        style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 32,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 344,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                color: Color.fromRGBO(37, 40, 49, 1),
                height: 610,
                child: Scrollbar(
                  controller: _scrollController, // <---- Here, the controller
                  isAlwaysShown: true, // <---- Required
                  child: SingleChildScrollView(
                    controller: _scrollController, // <---- Same as the Scrollbar controller
                    child: Column(
                      children: [
                        _izoxlar("assets/images/Davron.png", "Davronbek Ashurov", "2021-03-30", "Ajoyiz zo`r gap yo`q")
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _izoxlar(String img, String name, String dateTime, String comment) {
    return Row(
      children: [
        Image.asset(img),
        SizedBox(width: 14),
        Container(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Poppins"),
              ),
              Text(
                dateTime,
                style: TextStyle(color: Color.fromRGBO(193, 193, 193, 1), fontFamily: "Poppins"),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                comment,
                style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _profile() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Dialog(),
          );
        });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
