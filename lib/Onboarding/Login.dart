import 'dart:convert';
import 'package:bid/Customer/Choose_date.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bid/Customer/Home.dart';
import 'package:bid/Onboarding/Forget_pass.dart';
import 'package:bid/Onboarding/Signup.dart';
import 'package:bid/Shared/Constants.dart';
import 'package:bid/localisation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>Login_state();

}

class Login_state  extends State<Login>{
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController login_owner_name_Controller = new TextEditingController();
  TextEditingController login_owner_password_Controller = new TextEditingController();
  bool passwordVisible;


  Future<void> validatendSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      await Owner_login(login_owner_name_Controller.text,
        login_owner_password_Controller.text,
      );

//      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Barber_home_page()
//      )
//      );
      //await execute(meter_no.text);
    } else {
      print('Form is invalid');
    }
  }
  Future<String> Owner_login(String username,String pass) async {
    var url = "https://otelna.bidash.ml/customers/v1/login/";
    var body =json.encode(
        {
          "str": {"email":username,
            "password":pass}
        }
    )
    ;
    print(username);
    print(pass);
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
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Choose_date()
          )
          );
          Fluttertoast.showToast(
              msg: "Logged In",
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
      else if(response.statusCode==400)
        {
          Fluttertoast.showToast(
              msg: "Invalid email or password",
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
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible=false;
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
                image: AssetImage("images/barca_bg.png"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
              ),
            ),
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                            margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: new EdgeInsets.all(20.0),
                //autovalidate: true,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                          fontWeight: FontWeight.bold,
                        color: goldenclr,
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
//                      onSaved: (String value) {
//                        this.dataFromAPI= value;
//                      },
                        controller:login_owner_name_Controller,
                        // initialValue:this.dataFromAPI,

                        validator: (value){
                          if(value.isEmpty){
                            return "Email cannot be empty";
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder:enable_border,
                          focusedBorder:focused_border,
                          hintText: "Email Address:",
                          hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: hintclr),
                        ),
                        //textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal,color:Colors.white),
                      ),
                    ),
                    const_sizedbox,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration:trasperent_widget,
                      child: TextFormField(
//                      onSaved: (String value) {
//                        this.dataFromAPI= value;
//                      },
                        controller: login_owner_password_Controller,
                        // initialValue:this.dataFromAPI,
                        validator: (value){
                          if(value.isEmpty){
                            return "Password cannot be empty";
                          }
                        },
                        decoration: InputDecoration(
                            enabledBorder:enable_border,
                            focusedBorder:focused_border,
                          hintText: "Password:",
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
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal,color:Colors.white),
                        obscureText: !passwordVisible,
                      ),
                    ),
                   SizedBox(
                     height: 5,
                   ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              InkWell(
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Forget_pass()));
                                },
                              ),
                            ],
                          ),




                        ],
                      ),
                    ),
                    const_sizedbox,
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      //child: const Card(child: Text('Hello World!')),
                      child: RaisedButton(
                        color: goldenclr,
                        onPressed: () {
                          validatendSave();
//                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Home_Screen()
//                              )
//                              );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),

                            ),
                            side: BorderSide(color: Color(0xFF607d8b))
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(color:Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                'Don\'t have an acccount?',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                child: Text(
                                  'Signup',
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Signup()));
                                },
                              ),
                            ],
                          ),




                        ],
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