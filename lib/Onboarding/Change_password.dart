import 'dart:convert';
import 'package:bid/Onboarding/Login.dart';
import 'package:bid/Shared/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Change_password extends StatefulWidget {
  String token;
  Change_password(this.token);
  @override
  _Change_passwordState createState() => _Change_passwordState(token);
}

class _Change_passwordState extends State<Change_password> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    String token;
  bool passwordVisible;
  bool confirm_passwordVisible;
  TextEditingController new_password_controller = new TextEditingController();
  TextEditingController user_confirm_password_Controller = new TextEditingController();
  _Change_passwordState(this.token);


    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      passwordVisible=false;
      confirm_passwordVisible=false;
    }
  Future<void> validatendSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');

      await New_pass(token,new_password_controller.text);


      //await execute(meter_no.text);
    } else {
      print('Form is invalid');
    }
  }

  Future<String> New_pass(String token,String new_password) async {
    var url = "http://otelna.bidash.ml/customers/v1/forgot_password/";
    var body =json.encode(
        {
          "str": {"token":token,
            "new_password":new_password}
        }
    );
    Map<String,String> headers = {
      'Content-type' : 'application/json',
      // 'Authorization': 'ZKqn2zM5p1aKUEiONRtDe6EoMpee6ADbQgpHmY6mtyPFEwDOColk2cgRNqSU4mR3',
    };
    try {
      print(body);
      print(new_password);
      print(token);
      final response = await http.post(url,body:body,headers:headers);
      print('corr poi update form');
      print(response.body);
      var _json = json.decode(response.body);
      print(_json["str"]);
      var str_decode= json.decode(_json["str"]);
      var statuscode=str_decode["statusCode"];
      //print("outer decode status code is:"+str_decode);
      print(statuscode);
//
      if(response.statusCode==200)
      {
//
        setState(() {

          Fluttertoast.showToast(
              msg: "Password Changed Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor:goldenclr,
              textColor:Colors.white,
              fontSize: 16.0
          );
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()
        )
        );
          //print(_json["str");

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
                      'Change Password',
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
//
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
                      decoration: trasperent_widget,
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty){
                            return "New Password field cannot be empty";
                          }
                          else if(value.length<=7){
                            return "Please enter a strong password";
                          }
                        },
//                      onSaved: (String value) {
//                        this.dataFromAPI= value;
//                      },
                        controller:new_password_controller,
                        // initialValue:this.dataFromAPI,
                        decoration: InputDecoration(
                          enabledBorder:enable_border,
                          focusedBorder:focused_border,
                          hintText: "Enter New Password:",
                          hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: hintclr),


                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: goldenclr,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            )
                        ),
                        //textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        obscureText: !passwordVisible,
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal,color:Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration:trasperent_widget,
                      child: TextFormField(
                        validator: (value) {
                          if(value.isEmpty)
                            return 'Confirm password cannot be Empty';
                          if(value != new_password_controller.text){
                            return "Passwords do not match";
                          }
                          return null;
                        },
//                                onSaved: (value) {
//                                  //APIClient.merchant.profile.address = value;
//                                },
//                                onChanged: (value){
//                                  user_confirm_password_Controller.text=value;
//                                },
                        controller: user_confirm_password_Controller,
                        decoration: InputDecoration(
                            enabledBorder:enable_border,
                            focusedBorder:focused_border,
                            hintText: "Confirm Password:",
                            hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: hintclr),
                            suffixIcon: IconButton(
                              icon: Icon(
                                confirm_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color:goldenclr,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  confirm_passwordVisible = !confirm_passwordVisible;
                                });
                              },
                            )
                        ),
                        //textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        obscureText: !confirm_passwordVisible,
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal,color:Colors.white),

                      ),

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
                           // side: BorderSide(color: Color(0xFF607d8b))
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
