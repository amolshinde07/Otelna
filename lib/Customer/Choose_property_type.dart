import 'package:bid/Shared/Constants.dart';
import 'package:flutter/material.dart';

class Choose_property_type extends StatefulWidget {
  @override
  _Choose_property_typeState createState() => _Choose_property_typeState();
}

class _Choose_property_typeState extends State<Choose_property_type> {
  var property_type=[];
  bool pressAttention_hotels=false;
  bool pressAttention_apart_hotels=false;
  bool pressAttention_apartments=false;
  bool pressAttention_resorts=false;
  bool pressAttention_villas=false;
  bool pressAttention_bed_brkfast=false;
  bool pressAttention_home_stay=false;
  bool pressAttention_country_house=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_bar_clr,
      ),
      body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.only(top: 35,left: 20,right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color:pressAttention_hotels ? filter_color : Colors.grey,
                      onPressed: () => setState(() => pressAttention_hotels = !pressAttention_hotels),
                      child: Text(
                        'Hotels',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color:pressAttention_apart_hotels ? filter_color : Colors.grey,
                      onPressed: () => setState(() => pressAttention_apart_hotels = !pressAttention_apart_hotels),
                      child: Text(
                          'Apart Hotels',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color:pressAttention_apartments ? filter_color : Colors.grey,
                      onPressed: () {

                        setState(() {
                          pressAttention_apartments = !pressAttention_apartments;
                          if (pressAttention_apartments == true) {
                            property_type.add('"Apartments"');
                            print(property_type);
                          }
                          else {
                            property_type.remove('"Apartments"');
                            print(property_type);
                          }
                        }
                          );
                        },
                      child: Text(
                        'Apartments',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color:pressAttention_resorts ? filter_color : Colors.grey,
                      onPressed: () {

                        setState(() {
                          pressAttention_resorts = !pressAttention_resorts;
                          if (pressAttention_resorts == true) {
                            property_type.add('"Resorts"');
                            print(property_type);
                          }
                          else {
                            property_type.remove('"Resorts"');
                            print(property_type);
                          }
                        }
                        );
                      },
                      child: Text(
                        'Resorts',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color:pressAttention_villas ? filter_color : Colors.grey,
                      onPressed: () {

                        setState(() {
                          pressAttention_villas = !pressAttention_villas;
                          if (pressAttention_villas == true) {
                            property_type.add('"Villas"');
                            print(property_type);
                          }
                          else {
                            property_type.remove('"Villas"');
                            print(property_type);
                          }
                        }
                        );
                      },
                      child: Text(
                        'Villas',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color:pressAttention_bed_brkfast ? filter_color : Colors.grey,
                      onPressed: ()  {

                        setState(() {
                          pressAttention_bed_brkfast = !pressAttention_bed_brkfast;
                          if (pressAttention_bed_brkfast == true) {
                            property_type.add('"Bed & Breakfast"');
                            print(property_type);
                          }
                          else {
                            property_type.remove('"Bed & Breakfast"');
                            print(property_type);
                          }
                        }
                        );
                      },
                      child: Text(
                        'Bed & Breakfast',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color:pressAttention_home_stay ? filter_color : Colors.grey,
                      onPressed: ()  {

                            setState(() {
                              pressAttention_home_stay = !pressAttention_home_stay;
                            if (pressAttention_home_stay == true) {
                            property_type.add('"Bed & Breakfast"');
                            print(property_type);
                            }
                            else {
                            property_type.remove('"Bed & Breakfast"');
                            print(property_type);
                            }
                            }
                            );
                            },
                      child: Text(
                        'Homestay',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      color:pressAttention_country_house ? filter_color : Colors.grey,
                      onPressed: ()  {

                        setState(() {
                          pressAttention_country_house = !pressAttention_country_house;
                          if (pressAttention_country_house == true) {
                            property_type.add('"Bed & Breakfast"');
                            print(property_type);
                          }
                          else {
                            property_type.remove('"Bed & Breakfast"');
                            print(property_type);
                          }
                        }
                        );
                      },
                      child: Text(
                        'Country  House',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  color: app_bar_clr,
                  onPressed: (){
                    Navigator.pop(context,property_type[0].toString());
                  },
                  child: Text(
                    'Choose your property type',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
          ),
        ) ;

  }
}
