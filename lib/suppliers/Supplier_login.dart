import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Supplier_login extends StatefulWidget {
  @override
  _Supplier_loginState createState() => _Supplier_loginState();
}

class _Supplier_loginState extends State<Supplier_login> {
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
    var url = "http://api.saptal.in/Vendor/login";
    var body = {
      "user_name":username,
      "user_password":pass,

    }
    ;
    print(username);
    print(pass);

    try {
      //print(body);
      final response = await http.post(url,body:body,headers:null);
      print('corr poi update form');
      print(response.body);
      var _json = json.decode(response.body);
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
//            margin: EdgeInsets.all(10.0),
//            padding: EdgeInsets.all(10.0),
              color: new Color(0xFFf6f8f8),
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                            margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),

              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.

              child: new Container(
                padding: new EdgeInsets.all(20.0),

                //autovalidate: true,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: CircleAvatar(
                          child: Text(
                              'Logo'
                          ),
                          radius: 40,
                          backgroundColor: Colors.white,
                        )
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
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent, width: 1.0),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0.0)
                      ),
                      child: TextFormField(
//                      onSaved: (String value) {
//                        this.dataFromAPI= value;
//                      },
                        controller:login_owner_name_Controller,
                        // initialValue:this.dataFromAPI,

                        validator: (value){
                          if(value.isEmpty){
                            return "Username cannot be empty";
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Username:",
                          hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                        ),
                        //textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),



                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent, width: 1.0),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0.0)
                      ),
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
                            border: InputBorder.none,
                            hintText: "Password:",
                            hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
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
                        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                        obscureText: passwordVisible,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      //width: 200.0,
                      height: 10.0,
                      //child: const Card(child: Text('Hello World!')),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.grey
                            ),
                          ),
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Forget_pass()));
                          },
                        ),
                        SizedBox(
                          width: 100,
                          height: 50.0,
                          //child: const Card(child: Text('Hello World!')),
                          child: RaisedButton(
                            color: new Color(0xFF4766ff),
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
                              style: TextStyle(color: new Color(0xFFffffff)),
                            ),
                          ),
                        ),


                      ],
                    ),
                    SizedBox(
                      height: 20,
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
