import 'package:flutter/material.dart';
import 'package:sibetonapp/main.dart';

class ProductDetail extends StatefulWidget {
  final productDetailname;
  final productDetailNewPrice;
  final productDetailOldPrice;
  final productDetailPicture;

  ProductDetail(
      {this.productDetailname,
      this.productDetailNewPrice,
      this.productDetailOldPrice,
      this.productDetailPicture});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new MyHomePage()));
          },
          child: Image.asset(
            'images/Sibeton-logo.png',
            height: 35.0,
          ),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child:
                    Image.asset(widget.productDetailPicture, fit: BoxFit.cover),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: new Text(
                      widget.productDetailname,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Center(
                          child: new Text(
                            "\Rp. ${widget.productDetailNewPrice}/m3",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red[800]),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),

          // =======The First Button======
          Row(
            children: <Widget>[
              // =======The Kuantitas Button=======
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text(
                            "Jumlah",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: new Text("Pilih Jumlah"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.black,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: new Text(
                      "Jumlah",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),
            ],
          ),

          // =======The Second Button======
          Row(
            children: <Widget>[
              // =======The Kuantitas Button=======
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red[800],
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text(
                    "Buy Now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.red[800],
                  onPressed: () {

                  }),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red[800],
                  onPressed: () {}),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          new ListTile(
            title: new Text(
              "Produk Detail",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
          ),
          Divider(
            color: Colors.black,
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(" Product name : ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.productDetailname),
              )
            ],
          ),

          Divider(color: Colors.grey),
//          SIMILAR PRODUCT SECTION
          Container(
            height: 360.0,
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var productList = [
    {
      "name": "RC-K300",
      "picture": "images/products/rc-k300.png",
      "old_price": "1.000.000",
      "price": "900.000",
    },
    {
      "name": "Ready Mix",
      "picture": "images/products/readymix-kecil-1.jpg",
      "old_price": "1.000.000",
      "price": "800.000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SimilarSingleProd(
          productName: productList[index]['name'],
          prodPicture: productList[index]['picture'],
          prodOldprice: productList[index]['old price'],
          prodPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SimilarSingleProd extends StatelessWidget {
  final productName, prodPicture, prodOldprice, prodPrice;

  SimilarSingleProd(
      {this.productName, this.prodPicture, this.prodOldprice, this.prodPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Hero(
            tag: productName,
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          //Here we are passing the values of the product to the product detail
                          builder: (context) => new ProductDetail(
                              productDetailname: productName,
                              productDetailNewPrice: prodPrice,
                              productDetailOldPrice: prodOldprice,
                              productDetailPicture: prodPicture)));
                },
                child: GridTile(
                    footer: Container(
                        color: Colors.white,
                        child: new Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                productName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                            new Text(
                              "\Rp$prodPrice",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    child: Image.asset(prodPicture, fit: BoxFit.cover)),
              ),
            )),
      ),
    );
  }
}
