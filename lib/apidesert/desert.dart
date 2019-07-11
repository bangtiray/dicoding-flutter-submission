/*
 * Submission create bay bangtiray at 7/8/19 3:19 PM
 * Copyright (c) 2019. . 
 */
import 'package:bangtiray_app/model/themeals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Desert extends StatefulWidget {
  @override
  _DesertState createState() => _DesertState();
}

class _DesertState extends State<Desert> {
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
                              builder: (context) => DetailPage(food: food)));
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
      return new Center(child: new CircularProgressIndicator());
    } else {
      return makeBody;
    }
  }

  getFood() async {
    String dataURL =
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert";
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

class DetailPage extends StatelessWidget {
  final Food food;

  DetailPage({Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Detail Desert :' + food.strMeal,
                style: TextStyle(fontSize: 15.0)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: food.idMeal,
                      child: Image.network(
                        food.strMealThumb,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(food.strMeal,
                        style: TextStyle(
                            fontSize: 25.0, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        food.strMeal,
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
