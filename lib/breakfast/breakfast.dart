/*
 * Submission create bay bangtiray at 7/5/19 7:43 AM
 * Copyright (c) 2019. . 
 */
import 'package:bangtiray_app/model/food.dart';
import 'package:flutter/material.dart';

class Breakfast extends StatefulWidget {
  @override
  _BreakfastState createState() => _BreakfastState();
}

class _BreakfastState extends State<Breakfast> {
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
                            child: Icon(Icons.restaurant_menu),
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
            title: Text('Detail Breakfast :' + food.foodName,
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
                      child: Text(food.foodDescription,
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.justify),
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
        foodName: "Tikus Manado / Kawok",
        foodImage: "tikus-goreng.jpg",
        foodDescription:
            "Bahan-bahan\n1 ekor kawok besar\nDaun leilem secukupnya di potong potong sekitar 1 1/2 cm \n(sayur Leilem ini dapat diabaikan jika tidak ada"),
    Food(
        foodName: "Bakso Beranak",
        foodImage: "bakso.jpg",
        foodDescription:
            "Bahan-bahan\n1 Daging sapi 500 gram, cincang. Tepung tapioka 75 gram. Es batu 150 gram. Bawang putih 4 siung. Bawang putih 3 siung, rajang dan goreng. Bawang merah 5 siung, rajang dan goreng. Telur ayam 1 butir (telur ukuran besar), Baking powder 1 sendok teh."),
    Food(
        foodName: "Ayam Asam Manis",
        foodImage: "ayam-asam-manis.jpg",
        foodDescription:
            "Bahan-bahan\n1 2 Bawang putih, cincang. Bawang merah 12 siung, iris-iris. Jahe 1 ruas jari telunjuk, cincang. 2 sdm. Kecap manis Bango. 5 sdm Saus tomat. 8 sdm Saus sambal. 1 sdm Lada bubuk."),
    Food(
        foodName: "Brokoli Siram Kepiting",
        foodImage: "brokoli-siram-kepiting.jpg",
        foodDescription:
            "Bahan-bahan\n1 2 bonggol (400 gram) brokoli, potong menurut kuntum, potong batangnya, rebus. 1 butir telur, kocok lepas. 100 gram daging kepiting , rebus. 3 siung bawang putih, cincang halus. 2 cm jahe, memarkan. 1/2 sendok teh kecap ikan. 1 1/2 sendok teh garam. 1/2 sendok teh merica bubuk"),
    Food(
        foodName: "Ikan Pindang Toap",
        foodImage: "ikan-pindang-toap.jpg",
        foodDescription:
            "Bahan-bahan\n1 Haluskan bawang merah, bawang putih, kemiri dan kunyit dengan sedikit air. Panaskan minyak, tumis serai, jahe, lengkuas, daun jeruk dan daun salam lalu, aduk sebentar lalu tambahkan bumbu halus, tumis hingga wangi. ...\nPada panci yang berbeda masukkan air, tumisan bumbu, ikan, kecap manis, merica, garam dan gula."),
    Food(
        foodName: "Capcay",
        foodImage: "capcay.jpg",
        foodDescription:
            "Bahan-bahan\n1 Bunga kol 1 buah Brokoli 1 buah Sawi putih 1 ikat Wortel 1 buah Bakso sapi 3 buah, iris tipis Bawang bombay 1 buah, iris halus Bawang putih 3 siung, iris halus Saus tiram 1 sdm Tepung maizena 1 sdm Merica bubuk sdt Gula pasir 1 sdt Margarin 2 sdm Penyedap rasa sapi sdt Garam sdt Air 200 ml"),
    Food(
        foodName: "Udang Putren",
        foodImage: "udang-putren.jpg",
        foodDescription:
            "Bahan-bahan\n1 1/4 kg putren (jagung muda/baby corn), potong miring 1 ons udang 4 butir bawang putih, iris 3 butir bawang merah, iris 1 cabe merah iris tipis 2 cabe rawit iris tipis 2 sdm minyak goreng untuk tumis 3 sdm Saus tiram secukupnya Saus Raja rasa secukupnya Kecap asin secukupnya garam secukupnya gula")
  ];
}
