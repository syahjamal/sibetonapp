import 'package:flutter/material.dart';
//My Import
import 'package:sibetonapp/components/cart_products.dart';


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new CartProducts(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text("Total : "),
              subtitle: new Text("\Rp 800.000"),
            )),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: new MaterialButton(
              onPressed: () {},
              child:
                    new Text("Check Out", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
                ))
          ],
        ),
      ),
    );
  }
}
