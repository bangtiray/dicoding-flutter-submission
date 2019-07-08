/*
 * Submission create bay bangtiray at 7/3/19 12:06 PM
 * Copyright (c) 2019. .
 */

import 'package:flutter/material.dart';
import 'package:bangtiray_app/model/food.dart';
import 'package:bangtiray_app/breakfast/breakfast.dart';
import 'package:bangtiray_app/desert/desert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
            fontFamily: 'Raleway'),
        home: LoadPage(title: 'Food Catalogue'));
  }
}

class LoadPage extends StatefulWidget {
  LoadPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  int _selectedIndex = 0;
  final _layoutPage = [Breakfast(), Desert()];

  void _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  

  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );
    final makeBottom = Container(
      height: 55.0,
      child: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu, color: Colors.white),
              title: Text(
                'Breakfast',
                style: new TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood, color: Colors.white),
              title: Text(
                'Desert',
                style: new TextStyle(color: Colors.white),
              )),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.deepPurple,
        currentIndex: _selectedIndex,
        onTap: _onSelectItem,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: makeBottom,
    );
  }
}