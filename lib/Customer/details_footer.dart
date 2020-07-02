
import 'package:bid/Customer/Widgets/Top_tab.dart';
import 'package:bid/Onboarding/Login.dart';
import 'package:bid/Onboarding/Signup.dart';
import 'package:flutter/material.dart';
class CatShowcase extends StatefulWidget {

  @override
  _CatShowcaseState createState() => new _CatShowcaseState();
}
class _CatShowcaseState extends State<CatShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs=[
      new Tab(text: 'TOP',),
      new Tab(text: 'CHEAPET',),
      new Tab(text: 'RATINGS & PRICE',),
    ];
    _pages=[
      new Top_tab(),
      new Top_tab(),
      new Top_tab(),
    ];
    _controller = new TabController(
        length: 3,
        vsync: this
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(0.0),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
          ),
          new Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: new TabBarView(
              children: _pages,
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}