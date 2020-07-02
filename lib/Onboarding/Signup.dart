import 'dart:convert';
import 'package:bid/Onboarding/Login.dart';
import 'package:bid/Shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart.';

class Signup extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>Signup_state();
}

class Signup_state extends State<Signup>{
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController last_name_Controller = new TextEditingController();
  TextEditingController user_password_Controller = new TextEditingController();
  TextEditingController First_name_Controller = new TextEditingController();
  TextEditingController user_email_Controller = new TextEditingController();
  TextEditingController user_phone_Controller = new TextEditingController();
  TextEditingController user_confirm_password_Controller = new TextEditingController();
  bool passwordVisible;
  bool confirm_passwordVisible;

  Future<void> validatendSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      await Customer_sign_up(
          user_email_Controller.text,
          user_password_Controller.text,
          First_name_Controller.text,
          last_name_Controller.text,
          user_phone_Controller.text);
//      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()
//      )
//      );
      //await execute(meter_no.text);
    } else {
      print('Form is invalid');
    }
  }


  Future<String> Customer_sign_up(String email,String pass,String first_name,String last_name,String mobile_no) async {
    var url = "http://otelna.bidash.ml/customers/v1/register/";
    var body = json.encode(
        {
          "str": {
            "first_name":first_name,
            "last_name":last_name,
            "email":email,
            "mobile":mobile_no,
            "password":pass
          }
        }
    )
    ;
    print(email);
    print(pass);
    Map<String,String> headers = {
      'Content-type' : 'application/json',
      // 'Authorization': 'ZKqn2zM5p1aKUEiONRtDe6EoMpee6ADbQgpHmY6mtyPFEwDOColk2cgRNqSU4mR3',
    };
    print(email);
    print(pass);
    print(first_name);
    print(mobile_no);
    try {
      //print(body);
      final response = await http.post(url,body:body,headers:headers);
      print('corr poi update form');
      print(response.body);
      var _json = json.decode(response.body);
      var str_decode= json.decode(_json["str"]);
      var error_msg=str_decode["msg"];
      //this.directUrl = _json["url"];
      print(error_msg);
      if(response.statusCode==200)
      {
        setState(() {

          Fluttertoast.showToast(
              msg: "Registered Successfully",
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
        }
        );
      }
      else if(response.statusCode==400)
      {
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
    confirm_passwordVisible=false;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:SingleChildScrollView(
          child:Form(
            key: _formKey,
              child: Container(
                //height: double.infinity,
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
                //constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color:Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage("images/barca_bg.png"),
                    fit: BoxFit.fill,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  ),
                ),
               child: SingleChildScrollView(
                 child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child:Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 70,
                                ),
                                Center(
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: goldenclr,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  height: 5.0,
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
                                    validator: (value){
                                      if(value.isEmpty){
                                        return "First Name field cannot be empty";
                                      }
                                    },
                                    controller: First_name_Controller,
                                    // initialValue:this.dataFromAPI,
                                    decoration: InputDecoration(
                                      enabledBorder:enable_border,
                                      focusedBorder:focused_border,
                                      hintText: "First Name:",
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
                                    validator: (value){
                                      if(value.isEmpty){
                                        return "Last Name cannot be empty";
                                      }
                                    },
                                    controller: last_name_Controller,
                                    decoration: InputDecoration(
                                      enabledBorder:enable_border,
                                      focusedBorder:focused_border,
                                      hintText: "Last Name:",
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
                                    validator: (value){
                                      if(value.isEmpty){
                                        return "E-mail address cannot be empty";
                                      }
                                    },
                                    controller:user_email_Controller ,
                                    // initialValue:this.dataFromAPI,
                                    decoration: InputDecoration(
                                      enabledBorder:enable_border,
                                      focusedBorder:focused_border,
                                      hintText: "E-mail Address:",
                                      hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: Colors.grey),


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
                                    validator: (value) {
                                      if(value.isEmpty || value.length < 6){
                                        return "Please enter a strong passsword";
                                      }
                                    },
                                    onSaved: (value) {
                                      //APIClient.merchant.profile.address = value;
                                    },
                                    controller: user_password_Controller,
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
                                          color: hintclr,
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


                                const_sizedbox,
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                  decoration:trasperent_widget,
                                  child: TextFormField(
                                    validator: (value) {
                                      if(value.isEmpty)
                                        return 'Confirm password cannot be empty';
                                      if(value != user_password_Controller.text){
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
                                            color: hintclr,
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
                                const_sizedbox,
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                  decoration:trasperent_widget,
                                  child: TextFormField(
                                    validator: (value) {
                                      if(value.isEmpty || value.length < 10){
                                        return "Please enter a valid Mobile Number";
                                      }
                                    },
                                    onSaved: (value) {
                                      //APIClient.merchant.profile.address = value;
                                    },
                                    controller:user_phone_Controller,
                                    decoration: InputDecoration(
                                      enabledBorder:enable_border,
                                      focusedBorder:focused_border,
                                      hintText: "Mobile Number:",
                                      hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: hintclr),
                                    ),
                                    //textCapitalization: TextCapitalization.characters,
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal,color:Colors.white),
                                  ),
                                ),



                                SizedBox(
                                  height: 5.0,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Already have an account?',
                                            style: TextStyle(
                                              color: Colors.white
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            child: Text(
                                                'Login',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()
                                              )
                                              );

                                            },
                                          )
                                        ],
                                      ),


                                    ],
                                  ),
                                ),
                              SizedBox(
                                height: 5.0,
                              ),



                                //            Center(
//              child: FutureBuilder<Execute>(
//                future: execute(),
//                builder: (context, snapshot) {
//                  if (snapshot.hasData) {
//                    setState(() {
//                      ExResponse = snapshot.data;
//                    });
//                    return Text("${snapshot.data.fatherName.toString()}");
//                  } else if (snapshot.hasError) {
//                    return Text("${snapshot.error}");
//                  }
//                  // By default, show a loading spinner.
//                  return CircularProgressIndicator();
//                },
//              ),
//////
//////
//////
////
////            )
//            )

                                    Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      child: FlatButton(
                                        onPressed: () {
                                          //pickImageFromGal+lery(ImageSource.gallery);
                                          validatendSave();
                                        },
                                        color:goldenclr,
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15.0),

                                          ),
                                          // side: BorderSide(color: Color(0xFF607d8b))
                                        ),
                                        child: Text('Register',
                                            style: TextStyle(
                                                color:Colors.black
                                            )
                                        ),
                                      ),
                                    ),

                              ],
                            ),
                          ),
                        ) ,
                      ],
                    ),
               ),
              ),
          ),
        )
    );
  }
}