import 'dart:ui';
import 'package:amedia_tv/class/data.dart';
import 'package:amedia_tv/class/news.dart';
import 'package:amedia_tv/class/slider.dart';
import 'package:amedia_tv/class/sort.dart';
import 'package:amedia_tv/class/newsId.dart';
import 'package:amedia_tv/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amedia_tv/services/categoryService.dart';
import 'package:amedia_tv/services/sortService.dart';
import 'package:amedia_tv/services/sliderService.dart';
import 'package:amedia_tv/services/yangilikService.dart';
import 'package:amedia_tv/services/NewsIdService.dart';
import 'click_post.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({required Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final HttpService httpService = new HttpService();
  final SortService sortService = new SortService();
  final SliderService sliderService = new SliderService();
  final YangiliklarService yangiliklarService = new YangiliklarService();
  final NewsIdService newsIdService = new NewsIdService();
  List<Data> futureData = <Data>[];
  var lang = "uz";

  void _changeLanguage(String language) async {
    MyApp.setLocale(context, language);
    setState(() {
      lang = language;
    });
  }

  @override
  void initState() {
    super.initState();
    // futureCategory = httpService.getCategory() as List<Categroy>;
  }

  var _chosenValue;
  var _chosenValueRu;
  TextEditingController controller = new TextEditingController();
  var dialog = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 40, 49, 1),
        title: Container(
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  dialog = 0;
                  dialog == 0
                      ? showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Dialog(
                                shape: RoundedRectangleBorder(
                                    // borderRadius: BorderRadius.circular(Constants.padding),
                                    ),
                                elevation: 0,
                                backgroundColor: Color.fromRGBO(0, 0, 0, 0.58),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: 450,
                                    height: 450,
                                    child: Column(
                                      children: [
                                        Align(
                                          child: Container(
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                icon: Image.asset("assets/icons/quit_but.png")),
                                          ),
                                          alignment: Alignment.topRight,
                                        ),
                                        Text(
                                          "Saytga kirish",
                                          style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: 'Poppins'),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 15),
                                          child: TextField(
                                            controller: controller,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 3),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1),
                                              ),
                                              prefixIcon: Image.asset("assets/icons/done_1.png"),
                                              labelText: "E-mail",
                                              labelStyle: TextStyle(color: Color.fromRGBO(182, 182, 182, 0.6)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 15),
                                          child: TextField(
                                            controller: controller,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white, width: 3),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1),
                                              ),
                                              prefixIcon: Image.asset("assets/icons/done_1.png"),
                                              labelText: "Parol",
                                              labelStyle: TextStyle(color: Color.fromRGBO(182, 182, 182, 0.6)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 70,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                          ),
                                          height: 46,
                                          width: 305,
                                          child: OutlinedButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Kirish',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12), // <-- Radius
                                                ),
                                                backgroundColor: Color.fromRGBO(252, 152, 36, 1)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            FlatButton(
                                              onPressed: () {
                                                Navigator.of(context, rootNavigator: true).pop();
                                                setState(() {
                                                  dialog = 1;
                                                  dialog == 1
                                                      ? showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return BackdropFilter(
                                                              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                                                              child: Dialog(
                                                                backgroundColor: Color.fromRGBO(0, 0, 0, 0.58),
                                                                child: SingleChildScrollView(
                                                                  child: Container(
                                                                    height: 600,
                                                                    width: 316,
                                                                    child: Column(
                                                                      children: [
                                                                        Container(
                                                                          alignment: Alignment.topRight,
                                                                          child: FlatButton(
                                                                            onPressed: () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                            child: Image.asset(
                                                                                "assets/icons/quit_but.png"),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "Ro`yxatdan o`tish",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 25,
                                                                              fontFamily: 'Poppins'),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 40,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 15),
                                                                          child: TextField(
                                                                            controller: controller,
                                                                            obscureText: true,
                                                                            decoration: InputDecoration(
                                                                              hintStyle: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 20,
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                    color: Colors.white, width: 3),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                    color:
                                                                                        Colors.white.withOpacity(0.5),
                                                                                    width: 1),
                                                                              ),
                                                                              prefixIcon: Image.asset(
                                                                                  "assets/icons/done_1.png"),
                                                                              labelText: "Ism",
                                                                              labelStyle: TextStyle(
                                                                                  color: Color.fromRGBO(
                                                                                      182, 182, 182, 0.6)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 15,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 15),
                                                                          child: TextField(
                                                                            controller: controller,
                                                                            obscureText: true,
                                                                            decoration: InputDecoration(
                                                                              hintStyle: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 20,
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                    color: Colors.white, width: 3),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                    color:
                                                                                        Colors.white.withOpacity(0.5),
                                                                                    width: 1),
                                                                              ),
                                                                              prefixIcon: Image.asset(
                                                                                  "assets/icons/done_1.png"),
                                                                              labelText: "E-mail",
                                                                              labelStyle: TextStyle(
                                                                                  color: Color.fromRGBO(
                                                                                      182, 182, 182, 0.6)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 15,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 15),
                                                                          child: TextField(
                                                                            controller: controller,
                                                                            obscureText: true,
                                                                            decoration: InputDecoration(
                                                                              hintStyle: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 20,
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                    color: Colors.white, width: 3),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                    color:
                                                                                        Colors.white.withOpacity(0.5),
                                                                                    width: 1),
                                                                              ),
                                                                              prefixIcon: Image.asset(
                                                                                  "assets/icons/done_1.png"),
                                                                              labelText: "Parol",
                                                                              labelStyle: TextStyle(
                                                                                  color: Color.fromRGBO(
                                                                                      182, 182, 182, 0.6)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 15,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 15),
                                                                          child: TextField(
                                                                            controller: controller,
                                                                            obscureText: true,
                                                                            decoration: InputDecoration(
                                                                              hintStyle: TextStyle(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 20,
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                    color: Colors.white, width: 3),
                                                                              ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                    color:
                                                                                        Colors.white.withOpacity(0.5),
                                                                                    width: 1),
                                                                              ),
                                                                              prefixIcon: Image.asset(
                                                                                  "assets/icons/done_1.png"),
                                                                              labelText: "Parolni qaytaring",
                                                                              labelStyle: TextStyle(
                                                                                  color: Color.fromRGBO(
                                                                                      182, 182, 182, 0.6)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 70,
                                                                        ),
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(30)),
                                                                          ),
                                                                          height: 46,
                                                                          width: 305,
                                                                          child: OutlinedButton(
                                                                            onPressed: () {},
                                                                            child: Text(
                                                                              'Ro`yxatdan o`tish',
                                                                              style: TextStyle(color: Colors.white),
                                                                            ),
                                                                            style: OutlinedButton.styleFrom(
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(
                                                                                      12), // <-- Radius
                                                                                ),
                                                                                backgroundColor:
                                                                                    Color.fromRGBO(252, 152, 36, 1)),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height: 30,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            FlatButton(
                                                                              onPressed: () {
                                                                                setState(() {
                                                                                  dialog = 0;
                                                                                });
                                                                              },
                                                                              child: Text(
                                                                                "Kirish",
                                                                                style: TextStyle(
                                                                                    color:
                                                                                        Color.fromRGBO(252, 152, 36, 1),
                                                                                    fontFamily: "Poppins",
                                                                                    fontSize: 15),
                                                                              ),
                                                                            ),
                                                                            FlatButton(
                                                                              onPressed: () {},
                                                                              child: Text(
                                                                                "Parolni tiklash",
                                                                                style: TextStyle(
                                                                                    color: Color.fromRGBO(
                                                                                        255, 255, 255, 1),
                                                                                    fontFamily: "Poppins",
                                                                                    fontSize: 15),
                                                                              ),
                                                                            )
                                                                          ],
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                      : SizedBox();
                                                });
                                              },
                                              child: Text(
                                                "Registratsiya",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(252, 152, 36, 1),
                                                    fontFamily: "Poppins",
                                                    fontSize: 15),
                                              ),
                                            ),
                                            FlatButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Parolni tiklash",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(255, 255, 255, 1),
                                                    fontFamily: "Poppins",
                                                    fontSize: 15),
                                              ),
                                            )
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                            ;
                          },
                        )
                      : SizedBox();
                },
                icon: Image.asset("assets/icons/Group.png"),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/icons/search.png"),
              ),
              SizedBox(
                width: 40,
              ),
              Image.asset("assets/icons/amediaIcon.png"),
              SizedBox(
                width: 40,
              ),
              Container(
                width: 40,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _changeLanguage("uz");
                    });
                  },
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
                  onPressed: () {
                    setState(() {
                      _changeLanguage("ru");
                    });
                  },
                  child: Text(
                    "RU",
                    style: TextStyle(fontSize: 18, color: Color.fromRGBO(180, 180, 180, 1)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _carousel(),
              Container(
                height: 65,
                padding: EdgeInsets.only(top: 10, left: 17, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  AppLocalizations.of(context)!.yangiliklar,
                  style:
                      TextStyle(fontFamily: 'Poppins', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
              Container(
                  height: 300,
                  child: FutureBuilder(
                      future: yangiliklarService.getNews(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        List<Yangiliklar> yangiliklar = snapshot.data;
                        if (snapshot.hasData) {
                          return SizedBox(
                            height: 300.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: yangiliklar.length,
                              itemBuilder: (context, index) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: FutureBuilder(
                                        future: newsIdService.getNewsFromId(yangiliklar[index].id),
                                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                                          NewsId newsId = snapshot.data;
                                          if (snapshot.hasData) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage("http://cdn.amediatv.uz/" + newsId.data.image),
                                                    fit: BoxFit.cover),
                                              ),
                                              height: 190,
                                              width: 224,
                                              child: Container(
                                                padding: EdgeInsets.only(left: 15, bottom: 28, right: 10),
                                                alignment: Alignment.bottomCenter,
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.only(top: 90),
                                                          height: 35,
                                                          width: 7,
                                                          color: Color.fromRGBO(242, 156, 36, 1),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Container(
                                                          width: 150,
                                                          child: Text(
                                                            lang == "uz"
                                                                ? yangiliklar[index].nameYangilik.uz
                                                                : yangiliklar[index].nameYangilik.ru,
                                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              height: 20,
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                        }),
                                  );
                                } else {
                                  return Text(snapshot.error.toString());
                                }
                              },
                            ),
                          );
                        } else {
                          return Text(snapshot.error.toString());
                        }
                      })),
              Container(
                padding: EdgeInsets.only(left: 17, top: 24, bottom: 14),
                alignment: Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.videolar,
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
              Container(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("assets/images/video.png"), fit: BoxFit.cover)),
                  height: 213,
                  width: 380,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClickPostPage(id: "id",)),
                      );
                    },
                    icon: Image.asset("assets/icons/play.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                padding: EdgeInsets.only(top: 9, left: 17, right: 18, bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(37, 40, 49, 1),
                ),
                height: 239,
                width: 380,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("assets/images/video.png"),
                            ),
                          ),
                          width: 70,
                          height: 60,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        Column(
                          children: [
                            Text(
                              "Voleyboll TV - 4",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "{36-40}",
                              style: TextStyle(color: Color.fromRGBO(182, 181, 181, 1)),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Image.asset("assets/icons/toj.png"),
                      ],
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppLocalizations.of(context)!.filmXaqida,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                    Container(
                      child: Text(
                        "Televidenieda milliy musobaqa o’yinini tasodifan ko’rgan o’rta maktab o’quvchisi  Shyo Xinata, bundan keyin voleybolga qiziqipketti. Xinata o’zining kichik bo’yligiga qaramasdan  o’zining “kichik giganti” nomi bilan televizorda ko’rgan mashhur voleybolchu kabi bo’lishga qaror qildi",
                        style: TextStyle(color: Color.fromRGBO(182, 181, 181, 1)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Color.fromRGBO(37, 40, 49, 1),
                child: Row(
                  children: [
                    SizedBox(
                      width: 17,
                    ),
                    lang == "uz"
                        ? FutureBuilder(
                            future: httpService.getData(),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              List<Data> data = snapshot.data;
                              return DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    dropdownColor: Color.fromRGBO(37, 40, 49, 1),
                                    hint: Text(
                                      // AppLocalizations.of(context)!.ongoing,
                                      "Ongoing",
                                      style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 17),
                                    ),
                                    value: _chosenValue,
                                    style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 17),
                                    onChanged: (newValue) {
                                      print(newValue);
                                      print(lang);
                                      setState(() {
                                        _chosenValue = newValue;
                                      });
                                    },
                                    icon: Image.asset("assets/icons/down_narrow.png"),
                                    items: data
                                        .map((Data data) => DropdownMenuItem(
                                              child: Text(data.nameuz),
                                              value: data.nameuz,
                                            ))
                                        .toList()),
                              );
                            })
                        : FutureBuilder(
                            future: httpService.getData(),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              List<Data> data = snapshot.data;
                              return DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    dropdownColor: Color.fromRGBO(37, 40, 49, 1),
                                    hint: Text(
                                      // AppLocalizations.of(context)!.ongoing,
                                      "Онгоинг",
                                      style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 17),
                                    ),
                                    value: _chosenValueRu,
                                    style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 17),
                                    onChanged: (newValue) {
                                      print(newValue);
                                      print(lang);
                                      setState(() {
                                        _chosenValueRu = newValue;
                                      });
                                    },
                                    icon: Image.asset("assets/icons/down_narrow.png"),
                                    items: data
                                        .map((Data data) => DropdownMenuItem(
                                              child: Text(data.nameru),
                                              value: data.nameru,
                                            ))
                                        .toList()),
                              );
                            }),
                    // Image.asset("assets/icons/down_narrow.png"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    child: FutureBuilder(
                      future: sortService.getSort(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        List<Sort> sort = snapshot.data;
                        if (snapshot.hasData) {
                          return Container(
                            child: Wrap(
                              // spacing: 15,
                              runSpacing: 15,
                              children: sort
                                  .map((Sort sort) => lang == "uz"
                                      ? _chosenValue == sort.category[0].nameuz
                                          ? Container(child: _categoryWrap(sort.image, sort.name.uz, sort.name.ru))
                                          : SizedBox()
                                      : _chosenValueRu == sort.category[0].nameuz
                                          ? Container(
                                              child: _categoryWrap(sort.image, sort.name.uz, sort.name.ru),
                                            )
                                          : SizedBox())
                                  .toList(),
                            ),
                          );
                        } else {
                          return Text(snapshot.error.toString());
                        }
                      },
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/update.png",
                          height: 12,
                          width: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!.kuproq,
                          style: TextStyle(color: Color.fromRGBO(242, 152, 36, 1)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _carousel() {
    int _currentIndex = 0;
    return FutureBuilder(
      future: sliderService.getSlider(),
      builder: (BuildContext contex, AsyncSnapshot snapshot) {
        List<SliderImage> sliderImage = snapshot.data;
        if (snapshot.hasData) {
          return Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    initialPage: 0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: sliderImage
                      .map((SliderImage slider) => Builder(
                            builder: (BuildContext context) {
                              return FlatButton(
                                onPressed: (){},
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, top: 83),
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "http://cdn.amediatv.uz/" + slider.serial.screen.original.first)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 28,
                                            width: 5,
                                            color: Color.fromRGBO(242, 152, 36, 1),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 280,
                                                child: Text(
                                                  lang == "uz" ? slider.serial.name.uz : slider.serial.name.ru,
                                                  style: _sytle(13, Colors.white),
                                                ),
                                              ),
                                              // Container(
                                              //   width: 280,
                                              //   child: Text(
                                              //     lang=="uz"?slider.serial.description.uz:slider.serial.description.ru,
                                              //     style: _sytle(10, Colors.white),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        } else {
          return Text(snapshot.error.toString());
        }
      },
    );
  }

  _categoryWrap(String imgUrl, String nameUz, String nameRu) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 17, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage("http://cdn.amediatv.uz" + imgUrl),
        ),
      ),
      width: 160,
      height: 185,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Container(
                width: 7,
                height: 35,
                color: Color.fromRGBO(242, 152, 36, 1),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      lang == "uz" ? nameUz : nameRu,
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 19,
          )
        ],
      ),
    );
  }

  _sytle(double size, Color color) {
    return TextStyle(fontSize: size, fontFamily: "Poppins", color: color);
  }
}
