import 'package:flutter/material.dart';
import 'package:sibetonapp/page_detail/product_detail.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "RC-K225",
      "picture": "images/products/rc-k225.png",
      "old_price": "700.000",
      "price": "650.000",
    },
    {
      "name": "RC-K250",
      "picture": "images/products/rc-k250.png",
      "old_price": "800.000",
      "price": "750.000",
    },
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
        return SingleProd(
          productName: productList[index]['name'],
          prodPicture: productList[index]['picture'],
          prodOldprice: productList[index]['old price'],
          prodPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SingleProd extends StatelessWidget {
  final productName, prodPicture, prodOldprice, prodPrice;

  SingleProd(
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
                          Expanded(child: Text(productName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                          ),
                          new Text("\Rp$prodPrice", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                        ],
                      )
                    ),
                    child: Image.asset(prodPicture, fit: BoxFit.cover)),
              ),
            )),
      ),
    );
  }
}
