import 'dart:async';
import 'package:bid/Onboarding/Signup.dart';
import 'package:bid/Shared/Constants.dart';
import 'package:bid/localisation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      localizationsDelegates: [
//        AppLocalizationsDelegate(),
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
//      ],
//      supportedLocales: [
//        Locale('en', ""),
//        Locale("es", ""),
//        Locale('ja', ''),
//      ],
//      onGenerateTitle: (BuildContext context) =>
//      AppLocalizations.of(context).title,
//      home:Splash_screen(),
//    );
//  }
//}

class Splash_screen extends StatefulWidget {
//  var token;
//  Splash_screen(this.token);
  @override
  _Splash_screenState createState() => _Splash_screenState();


}

class _Splash_screenState extends State<Splash_screen> {
//  var token;
//  _Splash_screenState(this.token);
  startTime() async {
    var _duration = new Duration(seconds:3);
    return new Timer(
        _duration,
            () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
            builder: (BuildContext context) =>Signup()
            )
            )
    );

  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/Signup');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color:overlay_clr,
            image: DecorationImage(
              image: AssetImage("images/bg_img.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

//              Column(
//                children: <Widget>[
//                  Image.asset(
//                    'images/splash1.png',
//                    height: 80,
//                    width: 80,
//                  ),
//                ],
//              ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Image.asset(
                      'images/splash_logo.png',
                      height:180,
                    ),
                    Text(
                      'Otelna',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: goldenclr

                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
