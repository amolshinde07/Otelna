import 'dart:convert';
import 'package:bid/Shared/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:bid/Onboarding/Verify_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forget_pass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>Forget_pass_state();

}

class Forget_pass_state  extends State<Forget_pass>{
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController email_Controller = new TextEditingController();
  Future<void> validatendSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      await Send_otp(email_Controller.text,
      );

//      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Verify_otp()
//      )
//      );
      //await execute(meter_no.text);
    } else {
      print('Form is invalid');
    }
  }

  Future<String> Send_otp(String email) async {
    var url = "http://otelna.bidash.ml/customers/v1/generate_otp_by_email/";
    var body =json.encode(
        {
          "str": {"email":email,
            }
        }
    );
    print(email);
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
      if(response.statusCode==200)
      {
        setState(() {
          print(_json["str"]);
          Fluttertoast.showToast(
              msg:"OTP Sent",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor:goldenclr,
              textColor:Colors.white,
              fontSize: 16.0
          );
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Verify_otp(email)
          )
          );
        }
        );
      }

      else if(response.statusCode==400)
      {
        setState(() {
          print(_json["str"]);
          Fluttertoast.showToast(
              msg: "Email must be a valid email",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor:goldenclr,
              textColor:Colors.white,
              fontSize: 16.0
          );
        }
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
                      'Forgot Password',
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
//                      backgroundColor: goldenclr,
//                      child: CircleAvatar(
//                        child: Icon(
//                            Icons.person_add,color: goldenclr,
//                        ),
//                        radius: 40,
//                        backgroundColor: Colors.white,
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
                            return "Email cannot be empty";
                          }
                        },
//                      onSaved: (String value) {
//                        this.dataFromAPI= value;
//                      },
                        controller: email_Controller,
                        // initialValue:this.dataFromAPI,
                        decoration: InputDecoration(
                          enabledBorder:enable_border,
                          focusedBorder:focused_border,
                          hintText: "Enter Email:",
                          hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: hintclr),
                        ),
                        //textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
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
                          style: TextStyle(color:Colors.black),
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