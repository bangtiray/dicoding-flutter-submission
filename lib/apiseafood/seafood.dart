/*
 * Submission create bay bangtiray at 7/8/19 4:54 PM
 * Copyright (c) 2019. . 
 */
import 'package:bangtiray_app/model/themeals.dart';
import 'package:bangtiray_app/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Seafood extends StatefulWidget {
  @override
  _SeafoodState createState() => _SeafoodState();
}

class _SeafoodState extends State<Seafood> {
  List<Food> foods = [];

  @override
  void initState() {
    super.initState();
    getFood();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    return Container();

    Card makeListTile(Food food) => Card(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(food.strMealThumb),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Text(food.strMeal,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  backgroundColor: Colors.black54,
                )),
          ),
        );

    InkWell makeCard(Food food) => InkWell(
          child: GestureDetector(
            onTap: () {
              final snackbar = SnackBar(
                content: Text("you Clicked : " + food.strMeal),
                action: SnackBarAction(
                    label: 'Open Detail with Hero',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailInfo(id: food.idMeal)));
                    }),
              );
              Scaffold.of(context).showSnackBar(snackbar);
            },
            child: Container(

              child: Hero(
                tag: food.idMeal,
                child: makeListTile(food),
              ),
            ),
          ),
        );
    final makeBody = Container(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: foods.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(foods[index]);
        },
      ),
    );
    if (foods.length == 0) {
      return Center(child: CircularProgressIndicator());
    } else {
     return makeBody;

    }
  }

  getFood() async {
    String dataURL =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood";
    http.Response response = await http.get(dataURL);
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        foods = (responseJson['meals'] as List)
            .map((p) => Food.fromJson(p))
            .toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }
}

