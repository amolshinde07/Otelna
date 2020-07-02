
import 'file:///C:/Users/AMOL/AndroidStudioProjects/bid/lib/Customer/Home.dart';
import 'package:bid/Onboarding/Login.dart';
import 'package:bid/Onboarding/Signup.dart';
import 'package:bid/PaypalPayment.dart';
import 'package:bid/Splash_screen.dart';
import 'package:bid/localisation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'locales/locales.dart';
import 'l18n/messages_all.dart';


Future<String> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //token = prefs.getString('token');
  print('shared');
  //print(token);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ""),
        Locale("es", ""),
        Locale('ja', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
      AppLocalizations.of(context).title,
    home: Splash_screen(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    Locale mylocale = Localizations.localeOf(context);
    return Scaffold(

      appBar: AppBar(title: Text(AppLocalizations
          .of(context)
          .title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations
                .of(context).message,
              style: TextStyle(
                  fontSize: mylocale.languageCode.contains("en") ? 25.0 : 15.0
              ),),
            RaisedButton(
              child: Text(
                  'Engilsh'
              ),
              onPressed: (){
                setState(() {
                  AppLocalizations.load(Locale('en',));
                });

//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                    builder: (BuildContext context) => PaypalPayment(
//                      onFinish: (number) async {
//
//                        // payment done
//                        print('order id: '+number);
//
//                      },
//                    ),
//                  ),
//                );

              },
            ),
            RaisedButton(
              child: Text(
                  'Spanish'
              ),
              onPressed: (){
                setState(() {
                  AppLocalizations.load(Locale('es',));
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => PaypalPayment(
                        onFinish: (number) async {

                          // payment done
                          print('order id: '+number);

                        },
                      ),
                    ),
                  );
                });



              },
            )
          ],
        ),
      ),
    );
  }


}
