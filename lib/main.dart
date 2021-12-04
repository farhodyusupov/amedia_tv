// @dart=2.9
import 'package:amedia_tv/screens/testScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key key}): super(key: key);

  static void setLocale(BuildContext context, String newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }
  static int identLang(BuildContext context){
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.identLang();

  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _language= "uz";
  Locale _locale;
  setLocale(String locale) {
    setState(() {
      Locale.fromSubtags(languageCode: 'uz');
      _language = locale;
    });
  }

  identLang(){
    if(_language == "uz"){
      return 1;
    }if(_language == "ru"){
      return 0;
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "A-MEDIA",
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('uz', ''), // Spanish, no country code
        const Locale('ru', ''), // English, no country code
      ],
      locale: Locale(_language),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: ChewieDemo(),
    );
  }
  void changeLanguage (String lang){
    setState(() {
      _language = lang;
    });
  }
}

