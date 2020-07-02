import 'package:bid/Shared/Constants.dart';
import 'package:flutter/material.dart';

class Create_bid extends StatefulWidget {
  @override
  _Create_bidState createState() => _Create_bidState();
}

class _Create_bidState extends State<Create_bid> {
  var property_type=[];
  bool pressAttention_with_breakfast=false;
  bool pressAttention_without_breakfast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: overlay_clr,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height:350,
              width: double.infinity,
              child: Stack(
                  children: <Widget>[
                    Image.asset('images/hotel.jpeg',),

                    Column(
                      children: [
                        SizedBox(
                          height: 170,
                        ),
                        Container(
//                          color: overlay_clr,
                          decoration: BoxDecoration(
                            color:overlay_clr,
                            image: DecorationImage(
                              image: AssetImage("images/hotel.jpeg"),
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                            ),
                          ),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            //color: overlay_clr,
                            decoration: trasperent_widget,
                            padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                            child: Column(
                              children: [
                                Text(
                                  'Berlin',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      '4 Nights,',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),

                                    Text(
                                      '14 July',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '18 July,',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(

                                      icon: Icon(Icons.create,color: Colors.white,),
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ]
              ),

            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: (){},
                        color:overlay_clr,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),

                            ),
                            side: BorderSide(color: Colors.transparent)
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_bar,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Filter',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      RaisedButton(
                        onPressed: (){},
                        color:overlay_clr,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),

                            ),
                            side: BorderSide(color: Colors.transparent)
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Maps',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20,bottom: 20),
                    child: Column(
                      children: [
                        Text(
                          'Enter Hotel Name'
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            'Star Rating'
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding:EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: Text(
                                'Unrated'
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                      '1'
                                  ),

                                  Icon(Icons.stars,size: 25,)
                                ],
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                      '2'
                                  ),

                                  Icon(Icons.stars,size: 25,)
                                ],
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                      '3'
                                  ),

                                  Icon(Icons.stars,size: 25,)
                                ],
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                      '4'
                                  ),

                                  Icon(Icons.stars,size: 25,)
                                ],
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                      '5'
                                  ),

                                  Icon(Icons.stars,size: 25,)
                                ],
                              ),
                            ),

                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RaisedButton(
                                onPressed: (){},
                                color:Colors.brown,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),

                                    ),
                                    side: BorderSide(color: Colors.transparent)
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Location',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              RaisedButton(
                                onPressed: (){},
                                color:Colors.brown,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),

                                    ),
                                    side: BorderSide(color: Colors.transparent)
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.assignment,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Facilities',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                'Bid your own price per room/night',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20,right: 20,top: 0,bottom: 10),
                          child: Row(
                            children: [
                              Text(
                                  'Tell the hotel how much you want to pay'
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration:trasperent_widget,
                          child: TextFormField(
                            validator: (value){
                              if(value.isEmpty){
                                return "Amount cannot be empty";
                              }
                            },
                            //controller: last_name_Controller,
                            decoration: InputDecoration(
                              enabledBorder:enable_border,
                              focusedBorder:focused_border,
                              hintText: "Enter Amount:",
                              hintStyle: TextStyle(fontSize: 15.0,fontWeight: FontWeight.normal,color: hintclr),
                            ),

                            //textCapitalization: TextCapitalization.characters,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal,color:Colors.black),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 150,
                              child: RaisedButton(
                                color:pressAttention_with_breakfast ? Colors.brown : Colors.grey,
                                onPressed: ()  {

                                  setState(() {
                                    pressAttention_with_breakfast = !pressAttention_with_breakfast;
                                    if (pressAttention_with_breakfast == true) {
                                      pressAttention_without_breakfast=false;
                                      property_type.add('"With  Breakfast"');
                                      property_type.remove('"Without Breakfast"');
                                      print(property_type);
                                    }
                                    else {
                                      property_type.remove('"With  Breakfast"');
                                      print(property_type);
                                    }
                                  }
                                  );
                                },
                                child: Text(
                                  'With  Breakfast',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 30,
                              width: 150,
                              child: RaisedButton(
                                color:pressAttention_without_breakfast ? Colors.brown : Colors.grey,
                                onPressed: ()  {

                                  setState(() {
                                    pressAttention_without_breakfast = !pressAttention_without_breakfast;
                                    if (pressAttention_without_breakfast == true) {
                                      pressAttention_with_breakfast=false;
                                      property_type.add('"Without Breakfast"');
                                      property_type.remove('"With Breakfast"');
                                      print(property_type);
                                    }
                                    else {
                                      property_type.remove('"Without Breakfast"');
                                      print(property_type);
                                    }
                                  }
                                  );
                                },
                                child: Text(
                                  'Without Breakfast',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RaisedButton(
                                onPressed: (){},
                                color:Colors.brown,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),

                                    ),
                                    side: BorderSide(color: Colors.transparent)
                                ),
                                child: Row(
                                  children: [
                                    
                                    Text(
                                      'Bid Price',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    ) ;

  }
}
