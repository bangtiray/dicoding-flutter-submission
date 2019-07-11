/*
 * Submission create bay bangtiray at 7/8/19 5:45 PM
 * Copyright (c) 2019. .
 */

import 'package:bangtiray_app/model/detailmeals.dart';
import 'package:flutter/material.dart';
import 'package:bangtiray_app/service/services.dart';

class DetailInfo extends StatelessWidget {
  final String id;

  DetailInfo({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Info"),
        ),
        body: FutureBuilder<DetailFood>(
            future: getPost(),
            builder: (context, snapshot) {
              getBody();
              if (snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasData) {
                    print(snapshot.data);
                  }
                  else if (snapshot.hasError) {
                  return Text("Error");
                }

                return Text(
                    'Title from Post JSON : ${snapshot.data.strMeal} ${snapshot.data.strInstructions}');
              } else
                return CircularProgressIndicator();
            }));
  }

  getBody() {
    DetailFood food = DetailFood();
    createPost(food).then((response) {
      print(response.body);
    }).catchError((error) {
      print('error : $error');
    });
  }
}
