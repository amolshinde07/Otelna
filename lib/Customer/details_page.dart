
import 'package:bid/Customer/details_body.dart';
import 'package:bid/Customer/details_footer.dart';
import 'package:bid/Customer/details_header.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CatDetailsPage extends StatefulWidget {
//  final Cat cat;
  //final Object avatarTag;
//  CatDetailsPage(
//      this.cat, {
//        @required this.avatarTag,
//      });
  @override
  _CatDetailsPageState createState() => new _CatDetailsPageState();
}
class _CatDetailsPageState extends State<CatDetailsPage> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(

          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //new CatDetailHeader(),
              
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new CatDetailBody(),
              ),
              new CatShowcase(),
            ],
          ),
        ),
      ),
    );
  }
}