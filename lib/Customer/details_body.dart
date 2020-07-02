
import 'package:flutter/material.dart';
class CatDetailBody extends StatelessWidget {

  _createCircleBadge(IconData iconData, Color color){
    return new Padding(
      padding:const EdgeInsets.only(left: 8.0),
      child: new CircleAvatar(
        backgroundColor: color,
        child: new Icon(
          iconData,
          size: 16.0,
          color: Colors.black,
        ),
        radius: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    var locationInfo = new Row(
      children: <Widget>[
        new Icon(
          Icons.place,
          color: Colors.black,
          size: 16.0,
        ),
        new Padding(
            padding: const EdgeInsets.only(left: 8.0),
          child: new Text(
            'cat.location',
            style: textTheme.subhead.copyWith(color: Colors.black),
          ),
        ),
      ],
    );

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          'cat.name,',
          style: textTheme.headline.copyWith(color: Colors.black),
        ),
        new Padding(
            padding: const EdgeInsets.only(top: 4.0),
          child: locationInfo,
        ),
        new Padding(
            padding: const EdgeInsets.only(top: 16.0),
          child: new Text(
            'cat.description',
            style: textTheme.subhead.copyWith(color: Colors.black,fontSize: 16.0),
          ),
        ),

      ],
    );

  }
}