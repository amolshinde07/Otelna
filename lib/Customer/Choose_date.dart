import 'file:///C:/Users/AMOL/AndroidStudioProjects/bid/lib/Customer/Choose_rooms.dart';
import 'package:bid/Customer/Choose_guests.dart';
import 'package:bid/Customer/Choose_property_type.dart';
import 'package:bid/Customer/Create_bid.dart';
import 'package:bid/Search_city.dart';
import 'package:bid/Shared/Constants.dart';
import 'package:flutter/material.dart';

class Choose_date extends StatefulWidget {
  @override
  _Choose_dateState createState() => _Choose_dateState();
}

class _Choose_dateState extends State<Choose_date> {
  DateTime _dateTime;
  DateTime _dateTime_chkout;
  String _information = '';
  String _information_rooms = '';
  String _information_choose_property = '';
  String _information_city='';

  void updateInformation(String information) {
    setState(() => _information = information);
  }
  void updateInformation_rooms(String information) {
    setState(() => _information_rooms = information);
  }
  void updateInformation_choose_property(String information) {
    setState(() => _information_choose_property = information);
  }

  void updateInformation_city(String information) {
    setState(() => _information_city = information);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: overlay_clr,
        title: Text(
          "$_information_choose_property & more"
        ),
        actions: [
          IconButton(
            onPressed: ()async {
              final information_choose_property=await
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Choose_property_type()
              )
              );
              updateInformation_choose_property(information_choose_property);
              print("heeeeee");
              print("$information_choose_property");
            },
            icon: Icon(
              Icons.menu

            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child:Container(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                'CITY',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: ()async {
                  final information_city=await
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Search_city(),
                    settings: RouteSettings(name: 'SecondPage',),
                  )
                  );

                  updateInformation_city(information_city);
                  print("heeeeee");
                  print("$information_city");
                },
                child: Text(
                    "jj",

                  style: TextStyle(
                      color: Colors.brown,
                    decoration: TextDecoration.underline,
                    fontSize: 30
                  ),
                ),
              ),
              
              Container(

                padding: EdgeInsets.all(20),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap:(){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2070),
                                ).then((date) {
                                  setState(() {
                                    _dateTime=date;
                                    print(_dateTime.month);
                                  });
                                });
                              },
                              child: Container(
                                width: 160,
                                padding: EdgeInsets.all(20),
                                color:Colors.blueAccent[100],
                                child: Column(
                                  children: [
                                    Text(
                                      'CHECK IN',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),

                                    ),
                                    SizedBox(
                                      height:10
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                    _dateTime==null?'':"${_dateTime.day.toString()}".split(' ')[0],
                                          style: TextStyle(
                                            fontSize: 30,
                                              color: Colors.white
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          children: [

                                            Row(
                                              children: [
                                                Text(
                                                  _dateTime==null?'Pick':"${_dateTime.month.toString()}".split(' ')[0] ,
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                                Text(
                                                  '-',
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                                Text(
                                                  _dateTime==null?'Date':"${_dateTime.year.toString()}".split(' ')[0] ,
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                _dateTime==null?'':"${_dateTime.weekday.toString()}".split(' ')[0],
                                              style: TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2070),
                                ).then((date) {
                                  setState(() {
                                    _dateTime_chkout=date;
                                    print(_dateTime_chkout.month);
                                  });
                                });
                              },
                              child: Container(
                                width: 160,
                                padding: EdgeInsets.all(20),
                                color:Colors.blueAccent[100],
                                child: Column(
                                  children: [
                                    Text(
                                      'CHECK OUT',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),

                                    ),
                                    SizedBox(
                                        height:10
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          _dateTime_chkout==null?'':"${_dateTime_chkout.day.toString()}".split(' ')[0],
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          children: [

                                            Row(
                                              children: [
                                                Text(
                                                  _dateTime_chkout==null?'Pick':"${_dateTime_chkout.month.toString()}".split(' ')[0] ,
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                                Text(
                                                    '-',
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                                Text(
                                                  _dateTime_chkout==null?'Date':"${_dateTime_chkout.year.toString()}".split(' ')[0] ,
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              _dateTime_chkout==null?'':"${_dateTime_chkout.weekday.toString()}".split(' ')[0] ,
                                              style: TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                final information=await
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Chooose_guests()
                                )
                                );
                                updateInformation(information);
                                print("hehe");
                                print("$information");
                              },
                              child: Container(
                                width: 160,
                                padding: EdgeInsets.all(20),
                                color:Colors.blueAccent[100],
                                child: Column(
                                  children: [
                                    Text(
                                      "GUESTS",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),

                                    ),
                                    SizedBox(
                                        height:10
                                    ),
                                    Text(
                                      _information??"Pick number of guests",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: ()async {
                                final information_rooms=await
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Choose_rooms()
                                )
                                );
                                updateInformation_rooms(information_rooms);
                                print("heeeeee");
                                print("$information_rooms");
                              },
                              child: Container(
                                width: 160,
                                padding: EdgeInsets.all(20),
                                color:Colors.blueAccent[100],
                                child: Column(
                                  children: [
                                    Text(
                                      'ROOMS',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),

                                    ),
                                    SizedBox(
                                        height:10
                                    ),
                                    Text(
                                      _information_rooms??"Pick number of rooms",
                                      style: TextStyle(
                                          fontSize: 15,
                                        color: Colors.white
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 70,
                  height: 70,
                child: FloatingActionButton(
                  backgroundColor: app_bar_clr,
                    onPressed: (){
                      print('hi');
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Create_bid()
                      )
                      );
                    },
                  child: Text(
                    'SEARCH'
                  ),
                ),
              )
            ],
          ),
        ) ,
      ),
    );
  }
}
