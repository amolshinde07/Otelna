import 'package:bid/Onboarding/Login.dart';
import 'package:flutter/material.dart';

class Top_tab extends StatefulWidget {

  @override
  _Top_tabState createState() => _Top_tabState();
}

class _Top_tabState extends State<Top_tab> {
  bool bidtrigger=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '315',
                      style:TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                        'Properties found'
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),

              ),
              Container(

                height:MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                child: GridView.count(
                  childAspectRatio: MediaQuery.of(context).size.height/600,
                  //padding: EdgeInsets.all(10.0),
                  crossAxisCount: 1,
                  crossAxisSpacing: 13.0,
                  mainAxisSpacing: 20.0,
                  children: List.generate(10, (index) {

                    return InkWell(
                      onTap: () {
                        print('hi');
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              // builder: (context)=> Page1(),
                            ));
                      },

                      child: Column(
                        children: [
                          Divider(
                            color: Color(0XFFFFD037),
                            thickness: 3,height: 3,
                          ),
                          Container(
                            color: Colors.black,
                            child: Image.asset(
                              'images/hotel.jpeg',
                              height: 127,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                              width: double.infinity,
                              color: Color(0XFFE10D24),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.bookmark,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '7.9',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Hotel Central Park',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '240',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Manhattan, New York',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '3 x 4 nights',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                              Icons.location_on,
                                            color: Colors.white,
                                            size: 35,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '5 km from center',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),

                                          Row(
                                            children: [
                                              AbsorbPointer(
                                                absorbing:false,
                                                child: RaisedButton(
                                                child: Text(
                                                    'Create Bid'
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(15.0),

                                                    ),
                                                    side: BorderSide(color: Color(0xFF607d8b))
                                                ),
                                                onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Login()
                                            )
                                            );
                                                },
                                        ),
                                              ),
                                            ],
                                          ),

                                    ],
                                  ),
                                ],
                              ) ,
                            ),
                          )
                        ],
                      ),

                    );
                  }
                  ),
                ),
              ),
              SizedBox(
                height:400,
              )
            ],

          ),
        ),
      ),
    );
  }
}
