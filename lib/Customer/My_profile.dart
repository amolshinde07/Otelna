import 'dart:convert';
import 'package:bid/Onboarding/Offers_detail.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class My_profile extends StatefulWidget {
  @override
  _My_profileState createState() => _My_profileState();
}

class _My_profileState extends State<My_profile> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                          Icons.menu
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        'Save'
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),

                          ),
                          side: BorderSide(color: Color(0xFF607d8b))
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Offers_detail()
                        )
                        );
                      },
                    )
                  ],
                ),
                CircleAvatar(
                child: Icon(
                  Icons.person_add
                ),
                radius: 35,
                backgroundColor: Colors.blueGrey,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                  'Member since November 2019'
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),

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
                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                    'First Name'
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "First Name cannot be empty";
                                }
                              },
                              controller:user_email_Controller ,
                              // initialValue:this.dataFromAPI,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "First Name:",
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
                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                    'Last Name'
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if(value.isEmpty || value.length < 6){
                                  return "Last Name cannot be empty";
                                }
                              },
                              onSaved: (value) {
                                //APIClient.merchant.profile.address = value;
                              },
                              controller: user_password_Controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Last Name:",
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
                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                    'Country'
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "Country field cannot be empty";
                                }
                              },
                              controller: First_name_Controller,
                              // initialValue:this.dataFromAPI,
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
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                    'City'
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return "City cannot be empty";
                                }
                              },
                              controller: user_email_Controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "City:",
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
                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                    'Address'
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if(value.isEmpty || value.length < 10){
                                  return "Address cannot be empty";
                                }
                              },
                              onSaved: (value) {
                                //APIClient.merchant.profile.address = value;
                              },
                              controller:user_phone_Controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Address:",
                                hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                              ),
                              //textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.phone,
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
                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                    'Email ID'
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if(value.isEmpty || value.length < 10){
                                  return "Email ID cannot be empty";
                                }
                              },
                              onSaved: (value) {
                                //APIClient.merchant.profile.address = value;
                              },
                              controller:user_phone_Controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email ID:",
                                hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                              ),
                              //textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.phone,
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
                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                    'Mobile Number'
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.0),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0.0)
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if(value.isEmpty || value.length < 10){
                                  return "Mobile Number cannot be empty";
                                }
                              },
                              onSaved: (value) {
                                //APIClient.merchant.profile.address = value;
                              },
                              controller:user_phone_Controller,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mobile Number:",
                                hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                              ),
                              //textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          SizedBox(
                            height: 10.0,
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
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            child: FlatButton(
                              onPressed: () {

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
                              child: Text('Register',
                              ),
                            ),
                          )


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
                )
                
              ],
            ),
          ),
        )
    );
  }
}
