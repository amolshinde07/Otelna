import 'package:bid/Shared/Constants.dart';
import 'package:flutter/material.dart';

class Search_city extends StatefulWidget {


  @override
  _Search_cityState createState() => _Search_cityState();
}

class _Search_cityState extends State<Search_city> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_bar_clr,
        title: Text('Search City'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          },)
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final cities=[
    "berlin",
    "tokyo",
    "rio"

  ];
  final recentCities=[
    "berlin",
    "tokyo",
    "rio"
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // actoins for appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query="";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the appbar
    return IconButton(
      icon:AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return RaisedButton(
      onPressed: (){
        Navigator.of(context).popUntil((route){
          return route.settings.name == 'SecondPage';
        });
      },
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suuggestionList=query.isEmpty?recentCities:cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context,index)=>ListTile(
      onTap: (){
        showResults(context);
        //Navigator.pop(context,query.toString());
      },
        leading: Icon(
          Icons.location_city,
        ),
        title:RichText(
          text: TextSpan(
            text: suuggestionList[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: suuggestionList[index].substring(query.length),
                style: TextStyle(
                  color: Colors.grey,

                )
              )
            ]
          ),
        )

    ),
      itemCount: suuggestionList.length,
    );
  }

}