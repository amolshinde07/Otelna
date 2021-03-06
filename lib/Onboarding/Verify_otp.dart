import 'dart:convert';
import 'package:bid/Onboarding/Change_password.dart';
import 'package:bid/Shared/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Verify_otp extends StatefulWidget {
  String email;
  Verify_otp(this.email);

  @override
  _Verify_otpState createState() => _Verify_otpState(email);
}

class _Verify_otpState extends State<Verify_otp> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController otp_Controller = new TextEditingController();
  String email;
  _Verify_otpState(this.email);

  Future<void> validatendSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      var long2 = double.parse(otp_Controller.text);
      await Otp_verification(long2);

//      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Change_password()
//      )
//      );
      //await execute(meter_no.text);
    } else {
      print('Form is invalid');
    }
  }

  Future<String> Otp_verification(double otp) async {
    var url = "http://otelna.bidash.ml/customers/v1/verify_otp_by_email/";
    var body =json.encode(
        {
          "str": {"email":email,
            "otp":otp,
          }
        }
    )
    ;
    print(email);
    print(otp);
    Map<String,String> headers = {
      'Content-type' : 'application/json',
      // 'Authorization': 'ZKqn2zM5p1aKUEiONRtDe6EoMpee6ADbQgpHmY6mtyPFEwDOColk2cgRNqSU4mR3',
    };
    try {
      print(body);
      final response = await http.post(url,body:body,headers: headers);
      print('corr poi update form');
      print(response.body);
      var _json = json.decode(response.body);
      print(_json);
      if(response.statusCode==200)
      {
        setState(() {
          print('test');
          print(_json["str"]);
          var str_decode= json.decode(_json["str"]);
          var token=str_decode["data"]["token"];
          print(token);
          Fluttertoast.showToast(
              msg:"OTP Verified",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor:goldenclr,
              textColor:Colors.white,
              fontSize: 16.0
          );
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Change_password(token)
          )
          );
        }
        );
      }
      else if(response.statusCode==400)
      {
        var str_decode= json.decode(_json["str"]);
        var error_msg=str_decode["msg"];
        Fluttertoast.showToast(
            msg:error_msg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor:goldenclr,
            textColor:Colors.white,
            fontSize: 16.0
        );
      }
      setState(() {
        print('id');
        print(_json["response"]);

      }
      );
    }
    catch (e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: new Container(

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
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                            margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),

              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.

              child: new Container(
                height: MediaQuery.of(context).size.height,
                padding: new EdgeInsets.all(20.0),

                //autovalidate: true,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Verify OTP',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        color: goldenclr
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
//                    CircleAvatar(
//                      radius: 45,
//                      backgroundColor:goldenclr,
//                      child: CircleAvatar(
//                        child: Icon(
//                          Icons.person_add,color: goldenclr,
//                        ),
//                        radius: 40,
//                        backgroundColor:Colors.white,
//                      ),
//                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration:trasperent_widget,
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty){
                            return "OTP cannot be empty";
                          }
                        },
//                      onSaved: (String value) {
//                        this.dataFromAPI= value;
//                      },
                        controller:otp_Controller,
                        // initialValue:this.dataFromAPI,
                        decoration: InputDecoration(
                          enabledBorder:enable_border,
                          focusedBorder:focused_border,
                          hintText: "Enter OTP:",
                          hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: hintclr),
                        ),
                        //textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal,color:Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
//                  Container(
//                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//                    decoration: BoxDecoration(
//                        border: Border.all(color: Colors.transparent, width: 1.0),
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(0.0)
//                    ),
//                    child: TextFormField(
////                      onSaved: (String value) {
////                        this.dataFromAPI= value;
////                      },
//                      //controller:  TextEditingController()..text = this.name,
//                      // initialValue:this.dataFromAPI,
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        hintText: "Enter New Password:",
//                        hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
//                      ),
//                      textCapitalization: TextCapitalization.characters,
//                      keyboardType: TextInputType.text,
//                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
//                      obscureText: true,
//                    ),
//                  ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      //width: 200.0,
                      height: 10.0,
                      //child: const Card(child: Text('Hello World!')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      //child: const Card(child: Text('Hello World!')),
                      child: RaisedButton(
                        color:goldenclr,
                        onPressed: () {
                          validatendSave();

//                          setState(() {});
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),

                            ),
                            //side: BorderSide(color: Color(0xFF607d8b))
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          ),
        )
    );
  }
}
