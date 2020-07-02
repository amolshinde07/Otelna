import 'dart:convert';
import 'package:bid/suppliers/Supplier_address.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Supplier_register extends StatefulWidget {
  @override
  _Supplier_registerState createState() => _Supplier_registerState();
}

class _Supplier_registerState extends State<Supplier_register> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController last_name_Controller = new TextEditingController();
  TextEditingController user_password_Controller = new TextEditingController();
  TextEditingController First_name_Controller = new TextEditingController();
  TextEditingController user_email_Controller = new TextEditingController();
  TextEditingController user_phone_Controller = new TextEditingController();
  List<DropdownMenuItem<String>> listrem = [];
  String selectedrem = null;
  bool passwordVisible;

  void loaddata_rem() {
    listrem = [];
    listrem.add(
      new DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
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

          Text('jpn'),
        ],
      ),
      value: '9',
    )
    );
  }

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
    var url = "https://api.saptal.in/user/create";
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
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible=false;
  }
  @override
  Widget build(BuildContext context) {
    loaddata_rem();
    // TODO: implement build
    return Scaffold(
        body:SingleChildScrollView(
          child:Form(
            key:_formKey ,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child:Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                            validator: (value){
                              if(value.isEmpty){
                                return "Hotel Name cannot be empty";
                              }
                            },
                            controller:user_email_Controller ,
                            // initialValue:this.dataFromAPI,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Hotel Name:",
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
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              //border: Border.all(color: Colors.transparent, width: 1.0),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0)
                          ),
                          child: GestureDetector(
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
                                      //borderRadius: BorderRadius.circular(0.0),
                                    )
                                ),
                                //hint: Text('Choose Address Proof'),
                                items: listrem,
                                hint: Text('Hotel Type',
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

                                        break;
                                      case '5':
                                        print('case 5');


                                    }
                                  }
                                  );
                                }),
                          ),

                        ),
                        SizedBox(
                          height: 15,
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
                                return "E-mail cannot be empty";
                              }
                            },
                            controller: First_name_Controller,
                            // initialValue:this.dataFromAPI,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email-ID:",
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
                                return "Last Name cannot be empty";
                              }
                            },
                            controller: user_email_Controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Last Name:",
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
                                return "Please enter a strong passsword";
                              }
                            },
                            onSaved: (value) {
                              //APIClient.merchant.profile.address = value;
                            },
                            controller: user_password_Controller,
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
                            obscureText: !passwordVisible,
                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),

                          ),

                        ),
                        SizedBox(
                          height: 15,
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
                              if(value.isEmpty || value.length < 10){
                                return "Please enter a valid Phone Number";
                              }
                            },
                            onSaved: (value) {
                              //APIClient.merchant.profile.address = value;
                            },
                            controller:user_phone_Controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone Number:",
                              hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal),
                            ),
                            //textCapitalization: TextCapitalization.characters,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          height: 15,
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
                              if(value.isEmpty || value.length < 10){
                                return "Please enter a valid Mobile Number";
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
                          height: 10.0,
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Already a member?',
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Supplier_address()
                                    )
                                    );

                                  },
                                )
                              ],
                            ),


                          ],
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
                      ,SizedBox(
                        height: 10,
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 140,
                              height: 40.0,
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
                                child: Text('Save & Continue',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ) ,
              ],
            ),
          ),
        )
    );
  }
}
