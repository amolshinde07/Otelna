import 'dart:convert';
import 'package:bid/suppliers/Supplier_login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Supplier_address extends StatefulWidget {
  @override
  _Supplier_registerState createState() => _Supplier_registerState();
}

class _Supplier_registerState extends State<Supplier_address> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController last_name_Controller = new TextEditingController();
  TextEditingController user_password_Controller = new TextEditingController();
  TextEditingController First_name_Controller = new TextEditingController();
  TextEditingController user_email_Controller = new TextEditingController();
  TextEditingController user_phone_Controller = new TextEditingController();

  Future<void> validatendSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      await Customer_sign_up(last_name_Controller.text,
          user_password_Controller.text,
          First_name_Controller.text,
          user_email_Controller.text,
          user_phone_Controller.text);
//      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()
//      )
//      );
      //await execute(meter_no.text);
    } else {
      print('Form is invalid');
    }
  }


  Future<String> Customer_sign_up(String username,String pass,String contact_name,String email_id,String mobile_no) async {
    var url = "http://api.saptal.in/user/create";
    var body = {
      "user_name": username,
      "user_password": pass,
      "user_contact_name": contact_name,
      "user_email": email_id,
      "user_phone":mobile_no
    }
    ;
    print(username);
    print(pass);
    print(contact_name);
    print(email_id);
    print(mobile_no);
    try {
      //print(body);
      final response = await http.post(url,body:body,headers:null);
      print('corr poi update form');
      print(response.body);
      var _json = json.decode(response.body);
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:SingleChildScrollView(
          child:Form(
            key:_formKey ,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
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
                  padding: EdgeInsets.all(20.0),
                  decoration:BoxDecoration(

                  ),
                  child:Card(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "Address cannot be empty";
                                }
                              },
                              controller:user_email_Controller ,
                              // initialValue:this.dataFromAPI,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Address:",
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

                          SizedBox(
                            height: 5.0,
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
                              validator: (value) {
                                if(value.isEmpty || value.length < 6){
                                  return "City cannot be empty";
                                }
                              },
                              onSaved: (value) {
                                //APIClient.merchant.profile.address = value;
                              },
                              controller: user_password_Controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "City:",
                                hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                              ),
                              //textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
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
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "Zip Code cannot be empty";
                                }
                              },
                              controller: First_name_Controller,
                              // initialValue:this.dataFromAPI,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Zip Code:",
                                hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                              ),
                              //textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.text,
                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                            ),
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
                              validator: (value){
                                if(value.isEmpty){
                                  return "Country cannot be empty";
                                }
                              },
                              controller: user_email_Controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Country:",
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

                          SizedBox(
                            height: 10.0,
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
                        ],
                      ),
                    ),
                  ) ,
                ),
                Container(

                  width:200,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Supplier_login()
                      )
                      );
                      //pickImageFromGal+lery(ImageSource.gallery);
                      validatendSave();

                    },
                    color: Color(0xFF4766ff),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),

                        ),
                        side: BorderSide(color: Color(0xFF607d8b))
                    ),
                    child: Text('Save and Continue',
                    ),
                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}
