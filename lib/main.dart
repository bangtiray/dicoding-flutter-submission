/*
 * Submission create bay bangtiray at 7/3/19 12:06 PM
 * Copyright (c) 2019. .
 */

import 'package:flutter/material.dart';
import 'package:bangtiray_app/model/food.dart';

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
  List foods;

  @override
  void initState() {
    foods = getFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Column makeListTile(Food food) => Column(
          children: <Widget>[
            new Card(
              child: new Column(
                children: <Widget>[
                  new Image(
                    image: AssetImage("assets/images/" + food.foodImage),
                  ),
                  new Padding(
                      padding: new EdgeInsets.all(7.0),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.all(7.0),
                            child: new Icon(Icons.restaurant_menu),
                          ),
                          new Padding(
                            padding: new EdgeInsets.all(7.0),
                            child: new Text(
                              food.foodName,
                              style: new TextStyle(fontSize: 10.0),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        );

    InkWell makeCard(Food food) => InkWell(
          child: new GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(food: food)));
            },
            child: Container(
              child: makeListTile(food),
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

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
    );
  }
}

class DetailPage extends StatelessWidget {
  final Food food;

  DetailPage({Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Detail ' + food.foodName),
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
                    new Image(
                      image: AssetImage("assets/images/" + food.foodImage),
                    ),
                    new Text(food.foodName,
                        style: new TextStyle(
                            fontSize: 25.0, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center),
                    new Text(food.foodDescription,
                        style: new TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.justify)
                  ],
                ),
              ),
            );
          },
        ));
  }
}

List getFood() {
  return [
    Food(
        foodName: "Cendol / Dawet",
        foodImage: "cendol.jpg",
        foodDescription:
            "Bahan cara membuat cendol tepung beras:\n100 gram tepung hunkwe\n50 gram tepung beras\n100 ml air perasan daun pandan dan suji\n 700 ml air putih\n 1 sdt garam"),
    Food(
        foodName: "Jus Semangka",
        foodImage: "jus-semangka.jpg",
        foodDescription:
            "Resep membuat JUS SEMANGKA\n1. Blender Potongan semangka\n2. Gula halus atau madu secukupnya\n3. Air dingin dan es Batu"),
    Food(
        foodName: "Kacang Rebus",
        foodImage: "kacang-rebus.jpg",
        foodDescription:
            "Cuci bersih kacang tanah,rebus kacang tanah,selama 30 menit\nTambahkan garam,matikan api,diamkan selama 30 menit.\nNyalakan api,rebus kembali kacang tanah selama 1 jam. Matikan api,angkat kacang tiriskan.Kacang Tanah Empuk Manyuss siap dihidangkan"),
    Food(
        foodName: "Kentang Goreng",
        foodImage: "kentang-goreng.jpg",
        foodDescription:
            "Bahan-Bahan\n1. 3-4 buah kentang ukuran besar, kupas dan rendam.\n2. 1 sdm gula pasir.\n3. 1 sdt garam halus..\n4. 3 sdm tepung (1 sdm maizena dan 2 sdm tepung terigu)\n5. 3 siung bawang putih, geprek\n6. Garam halus atau bubuk kaldu "),
    Food(
        foodName: "Ketupat",
        foodImage: "ketupat.jpg",
        foodDescription:
            "Bahan Pembuatan Ketupat\n1. 1 kg beras (atau sesuai jumlah ketupat yang diinginkan dan pilihlah beras yang wangi seperti Rojolele, Pandan Wangi atau Mentik Spesial)\n2. Air putih secukupnya\n3. Garam dapur secukupnya\n4. Daun Pandan\n5. Anyaman ketupat"),
    Food(
        foodName: "Lemang",
        foodImage: "lemang.jpg",
        foodDescription:
            "Bahan-Bahan\n1. 1 liter ketan putih paris.\n2. 1 liter Santan kental\n3. 2 sdm Garam\n4. 2 lembar daun pandan.\n5. 1 sdt Vanili.\n6. Daun pisang\7. Cetakan Lontong"),
    Food(
        foodName: "Martabak",
        foodImage: "martabak.jpg",
        foodDescription:
            "Bahan\n125 gram tepung terigu protein sedang\n180 ml air matang\n4sendok makan margarin\n3 sendok makan gula pasir\n2 sendok makan susu bubukIopsional)\n1butir telur ayam\nSusu kental manis secukupnya"),
    Food(
        foodName: "Nasi Goreng",
        foodImage: "nasi-goreng.jpg",
        foodDescription:
            "Bahan:\nNasi\nKecap manis\nBubuk Terasi\nBawang putih - bawang merah - cabe rawit\nminyak sayur"),
    Food(
        foodName: "Nasi Korea",
        foodImage: "nasi-korea.jpg",
        foodDescription:
            "Bahan\n1 cup nasi putih\n2 Butir telur\nIrisan daun bawang\n2 sdm saus tiram\n1 sdt lada\n1 sdt margarin"),
    Food(
        foodName: "Opor Ayam",
        foodImage: "opor-ayam.jpg",
        foodDescription: "1 ekor ayam potong sesuai selera\n"
            "10 buah tahu coklat\n"
            "5 butir telur ayam rebus kupas\n"
            "1 buah kelapa ambil santan nya\n"
            "2 lembar daun salam\n"
            "2 batang sereh\n"
            "1 lembar daun jeruk\n"
            "10 buah cabai rawit\n"
            "3 buah cengkeh\n"
            "1 ruas lengkuas\n"
            "1 batang kayu manis\n"
            "Bawang goreng buat taburan\n"
            "Bumbu halus\n"
            "8 siung bawang merah\n"
            "4 siung bawang putih\n"
            "1 ruas kunyit\n"
            "1 ruas jahe\n"
            "3 butir kemiri\n"
            "1/2 bungkus lada bubuk\n"
            "Secukup nya ketumbar\n"
            "Penyedap\n"
            "Garam\nGula"),
    Food(
        foodName: "Pempek",
        foodImage: "pempek.jpg",
        foodDescription: "Bahan biang :\n"
            "25 gram tepung terigu\n"
            "200 ml air\n"
            "2 siung bawang putih\n"
            "------------///----------------\n"
            "300 gram ikan tenggiri\n"
            "1/2 sdm garam\n"
            "1 sdt gula pasir\n"
            "275 gram tepung sagu/tapioka\n"
            "Pelengkap :\n"
            "4 butir kuning telur untuk isian\n"
            "Minyak untuk menggoreng"),
    Food(
        foodName: "Rendang",
        foodImage: "rendang.jpg",
        foodDescription: "Bahan-bahan\n"
            "1 kg daging sapi khas\n"
            "1 kg kentang kecil\n"
            "500 gram hati sapi\n"
            "4000 ml santan kelapa\n"
            "250 gram cabe giling\n"
            "200 ml minyak sayur\n"
            "Bumbu yg diblender /dihaluskan\n"
            "150 gram cabe rawit ijo\n"
            "200 gram bawang merah\n"
            "150 gram bawang putih\n"
            "70 gram lengkuas\n"
            "50 gram jahe\n"
            "4 batang sere\n"
            "Bumbu pelengkap\n"
            "4 lembar daun kunyit\n"
            "10 lembar daun jeruk\n"
            "1/2 sdm penyedap\n"
            "2.5 sdm garam\n"
            "70 gram bumbu kering cap udang\n"
            "50 gram kelapa gongseng"),
    Food(
        foodName: "Sambal Gowang",
        foodImage: "sambal-gowang.jpg",
        foodDescription: "Bahan-bahan\n20 cabe rawit merah\n"
            "10 cabe merah keriting\n"
            "4 siung bawang putih\n"
            "1 bungkus kecil terasi (saya pake merk ABC)\n"
            "secukupnya Kaldu ayam bubuk\n"
            "secukupnya Garam\n"
            "secukupnya Minyak sayur mendidih"),
    Food(
        foodName: "Sosis Panggang",
        foodImage: "sosis-panggang.jpg",
        foodDescription:
            "Bahan-bahan\n6 buah sosis ayam/sapi\n4 sendok makan kecap manis\n1 sendok teh ketumbar"),
    Food(
        foodName: "Tikus Manado / Kawok",
        foodImage: "tikus-goreng.jpg",
        foodDescription:
            "Bahan-bahan\n1 ekor kawok besar\nDaun leilem secukupnya di potong potong sekitar 1 1/2 cm \n(sayur Leilem ini dapat diabaikan jika tidak ada")
  ];
}
