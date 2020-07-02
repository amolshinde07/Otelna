import 'package:bid/Customer/Home.dart';
import 'package:bid/Customer/details_body.dart';
import 'package:bid/Customer/details_footer.dart';
import 'package:flutter/material.dart';

class Offers_detail extends StatefulWidget {

  @override
  _Offers_detailState createState() => _Offers_detailState();
}

class _Offers_detailState extends State<Offers_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    IconButton(
                      icon:Icon(
                          Icons.arrow_back
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        'New York',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          '11-15 Dec'
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          '3 Guests'
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          '4 nights'
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.black,
                ),
                CatShowcase()

              ],
            ),
          ),
        )
    );
  }
}
