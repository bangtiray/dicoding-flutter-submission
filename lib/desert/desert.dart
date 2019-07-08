/*
 * Submission create bay bangtiray at 7/5/19 7:43 AM
 * Copyright (c) 2019. . 
 */
import 'package:bangtiray_app/model/food.dart';
import 'package:flutter/material.dart';

class Desert extends StatefulWidget {
  @override
  _DesertState createState() => _DesertState();
}

class _DesertState extends State<Desert> {
  List foods;

  @override
  void initState() {
    foods = getFood();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    return Container();
    Column makeListTile(Food food) => Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: food.foodName,
                    child: Image.asset("assets/images/" + food.foodImage,
                        fit: BoxFit.contain),
                  ),
                  Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Icon(Icons.fastfood),
                          ),
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              food.foodName,
                              style: TextStyle(fontSize: 10.0),
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
          child: GestureDetector(
            onTap: () {
              final snackbar = SnackBar(
                content: Text("you Clicked : " + food.foodName),
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
    return makeBody;
  }
}

class DetailPage extends StatelessWidget {
  final Food food;

  DetailPage({Key key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Detail Desert :' + food.foodName,
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
                      tag: food.foodName,
                      child: Image.asset(
                        "assets/images/" + food.foodImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(food.foodName,
                        style: TextStyle(
                            fontSize: 25.0, fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        food.foodDescription,
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
        foodName: "Martabak",
        foodImage: "martabak.jpg",
        foodDescription:
            "Bahan\n125 gram tepung terigu protein sedang\n180 ml air matang\n4sendok makan margarin\n3 sendok makan gula pasir\n2 sendok makan susu bubukIopsional)\n1butir telur ayam\nSusu kental manis secukupnya"),
    Food(
        foodName: "Sosis Panggang",
        foodImage: "sosis-panggang.jpg",
        foodDescription:
            "Bahan-bahan\n6 buah sosis ayam/sapi\n4 sendok makan kecap manis\n1 sendok teh ketumbar"),
    Food(
        foodName: "Kue Putu",
        foodImage: "kue-putu.jpg",
        foodDescription:
            "Bahan-bahan\n1. 800 gram Tepung Beras\n2. Air Secukupnya\n3. 6 Lembar Daun Pandan\n4. 250 gram gula merah, sisr terlebih dahulu\n5. Secukupnya partan kelapa lerlebih dahulu."),
    Food(
        foodName: "Jus Buah Naga",
        foodImage: "buah-naga.jpg",
        foodDescription:
            "Bahan-bahan\n1. Kerok daging buah naga. Jangan dikerok sampai ke dekat kulit bagian dalam. Masukkan ke dalam blender\n2. Tuangkan tiga botol yakult ke dalam blender. Masukkan tiga butir es batu\n3. Tuangkan jus ke dalam gelas dan sajikan dalam keadaan dingin. Tidak perlu disaring."),
    Food(
        foodName: "Puding Mozaik",
        foodImage: "puding-mozaik.jpg",
        foodDescription:
            "Bahan-bahan\n1. 2 bungkus Agar agar\n2. 1 bungkus Santan kara\n3. 2 gelas Gula pasir\n4. 2 gelas Gula pasir\n5. Pewarna makanan hijau,kuning,merah"),
    Food(
        foodName: "Puding Labu Bintik",
        foodImage: "puding-labu.jpg",
        foodDescription:
            "Bahan-bahan\n1. 2 bgks agar2 swallow plain\n2. 1 1/2 gelas gula pasir (menurut selera)\n3. 1 sachet santan kara (65ml)\n4. 4 sdm SKM\n5. 250 gr labu kuning (kurang lebih yaa)\n6. 7 gelas air"),
    Food(
        foodName: "Brownies Cokelat",
        foodImage: "brownies-cokelat.jpg",
        foodDescription:
            "Bahan-bahan\n. 150 gr tempe 2 btr telur 170 gr tepung terigu 1 sdt baking powder 1 sdt baking soda 250 ml susu cair coklat 50 gr coklat bubuk 100 gr gula pasir 2 bks SKM 100 ml minyak Simple sirup : 50 gr gula pasir 50 ml air panas Topping coklat : 35 gr coklat bubuk 100 ml susu cair coklat 1 bks SKM 1 sdm maizena 5 sdm minyak Sejumput garam"),
    Food(
        foodName: "Brownies Alpukat",
        foodImage: "browkat.jpg",
        foodDescription:
            "Bahan-bahan\n. 150 gr gula pasir, 120 gr mentega, 80 gr tepung terigu protein sedang, 4 butir telur, 70 gr cokelat batangan (compound chocolate), 2 sdm bubuk cokelat, 1/2 sdt sp, 1/2 sdt baking powder, 1/2 sdt pasta vanila, 500 gr alpukat, 120 ml susu kental manis, 100 ml air"),
    Food(
        foodName: "Cake Kukus",
        foodImage: "cake-kukus.jpg",
        foodDescription:
            "Bahan-bahan\n. 200 gram putih telur,1/4 sendok teh garam, 1 sendok teh emulsifier (SP/TBM), 100 gram gula pasir, 80 gram tepung terigu protein rendah, 25 gram minyak goreng, 25 ml santan kental dari 1/4 kelapa, 100 gram selai bluberi untuk olesan"),
    Food(
        foodName: "Brownies Cream",
        foodImage: "brownies-cream.jpg",
        foodDescription:
            "Bahan-bahan\n.-200 gram mentega tawar dingin, 125 gram gula pasir halus, 200 gram milk cooking chocolate, dilelehkan, 3 butir telur, 175 gram tepung terigu protein sedang, 25 gram susu bubuk, 1/2 sendok teh baking powder, 75 gram cokelat chips"),
    Food(
        foodName: "Bolu Muffin",
        foodImage: "muffin.jpg",
        foodDescription:
            "Bahan-bahan\n100 gram cream cheese, 30 gram gula tepung, 1 butir telur, dikocok lepas, 1 buah kuning telur, 1/8 sendok teh air jeruk lemon"),
  ];
}
