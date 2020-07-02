import 'package:bid/Shared/Constants.dart';
import 'package:flutter/material.dart';

class Choose_rooms extends StatefulWidget {
  @override
  _Choose_roomsState createState() => _Choose_roomsState();
}

class _Choose_roomsState extends State<Choose_rooms> {
  int _n = 0;
  int _m = 0;
  int total=0;
  void add() {
    setState(() {
      _n++;
    });
  }
  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }

  void add_children() {
    setState(() {
      _m++;
    });
  }
  void minus_children() {
    setState(() {
      if (_m != 0)
        _m--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: overlay_clr,
      ),
      body: SingleChildScrollView(
        child:Container(
          child: Column(
            children: [
              Container(

                padding: EdgeInsets.all(20),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Room 1")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Adults',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Age 14 years and above'
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: new Center(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new FloatingActionButton(
                                      heroTag: "btn1",
                                      onPressed: add,
                                      child: new Icon(Icons.add, color: Colors.black,),
                                      backgroundColor: Colors.white,),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    new Text('$_n',
                                        style: new TextStyle(fontSize: 30.0)),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    new FloatingActionButton(
                                      heroTag: "btn2",
                                      onPressed: minus,
                                      child: new Icon(
                                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                                          color: Colors.black),
                                      backgroundColor: Colors.white,),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Children',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        'Age 12 years and below'
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: new Center(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new FloatingActionButton(
                                      heroTag: "btn3",
                                      onPressed: add_children,
                                      child: new Icon(Icons.add, color: Colors.black,),
                                      backgroundColor: Colors.white,),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    new Text('$_m',
                                        style: new TextStyle(fontSize: 30.0)),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    new FloatingActionButton(
                                      heroTag: "btn4",
                                      onPressed: minus_children,
                                      child: new Icon(
                                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                                          color: Colors.black),
                                      backgroundColor: Colors.white,),
                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: FloatingActionButton(
                  onPressed: (){
                    total=_m+_n;
                    print(total);
                    Navigator.pop(context,total.toString());
                  },
                  child: Text('Done'),

                ),
              )
            ],
          ),
        ) ,
      ),
    );
  }
}
