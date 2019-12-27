import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sibetonapp/components/horizontal_listview.dart';
import 'package:sibetonapp/components/products.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 250.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/banner-hut6.jpg'),
          AssetImage('images/banner-lrt.jpg'),
          AssetImage('images/banner-sibeton.jpg'),
          AssetImage('images/banner-slagsilo.jpg'),
          AssetImage('images/banner-soetta.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 6.0,
        dotColor: Colors.grey,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            //Image Carousel
            imageCarousel,

            //Padding Widget
            new Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        ' Kategori Produk ',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),

            //Horizontal Listview Begins Here
            HorizontalList(),

            //Padding Widget
            new Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        ' Semua Produk ',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),

            //Gridview
            Container(
              height: 300.0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Products(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
