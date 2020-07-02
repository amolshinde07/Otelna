import 'dart:typed_data';
import 'package:bid/PaypalPayment.dart';
import 'package:bid/Shared/Constants.dart';
import "package:hex/hex.dart";
import 'package:bid/Customer/My_profile.dart';
import 'package:bid/localisation.dart';
import 'package:bid/suppliers/Supplier_register.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flag/flag.dart';
import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:convert/convert.dart';
class Home_Screen extends StatefulWidget {


  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var gcity=null;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  var shop_location;
  String selectedrem = null;
  List<DropdownMenuItem<String>> listrem = [];
  bool bidtrigger=true;
  void cry() {
    print('hi');
    final plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
    final key = encrypt.Key.fromUtf8('bf3c199c2470cb477d907b1e0917c17b');
    final iv = encrypt.IV.fromUtf8("mPaEg!Zq3Xlrn6\$0");
    const Base64Codec base64=Base64Codec();
    //var data=List[];

    final encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc,));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    print(encrypted.toString());// R4PxiU3h8YoIRqVowBXm36ZcCeNeZ4s1OvVBTfFlZRdmohQqOpPQqD1YecJeZMAop/hZ4OxqgC1WtwvX/hP9mw==
    print(encrypted.base64);
    print(encrypted.bytes.toString());
    print(StringBuffer(encrypted.bytes.toString()).toString());
    print(HEX.encode(encrypted.bytes))
;
//    data=encrypted.base64;
//    var samp=base64.encode(data);
    //  print(samp);
   // Buffer


  }



  void loaddata_rem() {
    listrem = [];
    listrem.add(
      new DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flag(
              'us',
              height: 30,
              width: 30,
            ),
            SizedBox(
              width: 10,
            ),

            Text('English'),
          ],
        ),
        value:'0',
      ),
    );

    listrem.add(new DropdownMenuItem
      (
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flag(
            'ar',
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text('AR'),

        ],
      ),
      value: '1',

    )
    );

    listrem.add(new DropdownMenuItem
      (
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Flag(
            'de',
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Deutsch'),
        ],
      ),
      value: '2',

    )
    );

    listrem.add(new DropdownMenuItem
      (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flag(
            'it',
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Italiano'),
        ],
      ),
      value: '3',
    )
    );
    listrem.add(new DropdownMenuItem
      (
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Flag(
            'fr',
            height: 30,
            width: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Text('Five'),
        ],
      ),
      value: '4',
    )
    );
    listrem.add(new DropdownMenuItem
      (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flag(
            'es',
             height: 30,
            width: 30,
          ),

          SizedBox(
            width: 10,
          ),
          Text('Six'),
        ],
      ),
      value: '5',
    )
    );
    listrem.add(new DropdownMenuItem
      (
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flag(
          'ru',
          height: 30,
          width: 30,
        ),

        SizedBox(
          width: 10,
        ),
        Text('ru'),
      ],
    ),
      value: '6',
    )
    );
    listrem.add(new DropdownMenuItem
      (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flag(
            'tr',
            height: 30,
            width: 30,
          ),

          SizedBox(
            width: 10,
          ),
          Text('tr'),
        ],
      ),
      value: '7',
    )
    );
    listrem.add(new DropdownMenuItem
      (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flag(
            'cn',
            height: 30,
            width: 30,
          ),

          SizedBox(
            width: 10,
          ),
          Text('cn'),
        ],
      ),
      value: '8',
    )
    );
    listrem.add(new DropdownMenuItem
      (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flag(
            'jp',
            height: 30,
            width: 30,
          ),

          SizedBox(
            width: 10,
          ),
          Text('jpn'),
        ],
      ),
      value: '9',
    )
    );
  }


  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    gcity=currentLocation;
    final coordinates = new Coordinates(gcity.latitude, gcity.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);


    setState(()  {

      var first = addresses.first;
      shop_location=first.featureName + first.addressLine;
      print(shop_location);

//      _getAddressFromLatLng();
    });
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation();
    cry();

  }
  @override
  Widget build(BuildContext context) {
    loaddata_rem();
    return Scaffold(
      appBar: AppBar(
        title:Text(
          'Select language',
          style: TextStyle(
            color: Colors.black
          ),
        ),
        backgroundColor: goldenclr,leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      ),
      body: Container(
        child: Column(
          children: [
//            RaisedButton(
//              child: Text(
//                  'Supplier signup'
//              ),
//              onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Supplier_register()
//                )
//                );
//              },
//            ),
            Text(
              AppLocalizations
                  .of(context).message,

            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Container(
                width: 250,
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 1.0),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0)
                ),
                child: GestureDetector(
                  child: DropdownButtonFormField(
                      style: TextStyle(color: Colors.pink, fontSize: 16.0),
                      decoration: InputDecoration(
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 5.0),
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      //hint: Text('Choose Address Proof'),
                      items: listrem,
                      hint: Text('Choose Language',
                        style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                      ),
                      value: selectedrem,
                      onChanged: (value) {
                        print(value);
                        selectedrem = value;
                        setState(() {
                          switch (value) {
                            case '0':
                              print('case 0');
                              AppLocalizations.load(Locale('en',));
                              break;
                            case '5':
                              print('case 5');
                              AppLocalizations.load(Locale('es',));

                          }
                        }
                        );
                      }),
                ),

              ),
            ),

            RaisedButton(
              color: overlay_clr,
              child: Text(
                'Save and Continue',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: (){
//                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>My_profile()
//      )
//      );
              },
            ),
//            RaisedButton(
//              child: Text(
//                  'Engilsh'
//              ),
//              onPressed: (){
//                setState(() {
//                  Navigator.of(context).push(
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
//
//                      });
//
////
//              },
//            ),





          ],
        ),
      ),
    );
  }
}
