import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productOnCart = [
    {
      "name": "RC-K225",
      "picture": "images/products/rc-k225.png",
      "price": "650.000",
      "quantity": 1,
    },
    {
      "name": "RC-K250",
      "picture": "images/products/rc-k250.png",
      "price": "750.000",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: productOnCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartproductName: productOnCart[index]["name"],
            cartprodPicture: productOnCart[index]["picture"],
            cartprodPrice: productOnCart[index]["price"],
            cartprodQty: productOnCart[index]["quantity"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartproductName, cartprodPicture, cartprodPrice, cartprodQty;

  SingleCartProduct(
      {this.cartproductName,
      this.cartprodPicture,
      this.cartprodPrice,
      this.cartprodQty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//        ====== LEADING IMAGE PRODUCT =====
        leading: new Image.asset(
          cartprodPicture,
          width: 100.0,
          height: 80.0,
        ),
//        ==== TITLE PRODUK =====
        title: new Text(cartproductName),

//        ==== SUBTITLE PRODUK =====
        subtitle: new Column(
          children: <Widget>[
//            ROW INSIDE COLUMN
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Harga :"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text("\Rp $cartprodPrice /m3"),
                ),
              ],
            ),
          ],
        ),
//===========MENENTUKAN JUMLAH ANGKA==========
//       trailing: new Column(
//         children: <Widget>[
//           new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
//           new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
//         ],
//       ),
      ),
    );
  }
}
