import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnCart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 160,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer2.jpeg",
      "price": 290,
      "size": "M",
      "color": "Red",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productsOnCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProName: productsOnCart[index]["name"],
            cartProColor: productsOnCart[index]["color"],
            cartProPics: productsOnCart[index]["picture"],
            cartProPrice: productsOnCart[index]["price"],
            cartProQty: productsOnCart[index]["quantity"],
            cartProSize: productsOnCart[index]["size"],
          );
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProName;
  final cartProPics;
  final cartProPrice;
  final cartProSize;
  final cartProColor;
  final cartProQty;

  SingleCartProduct(
      {this.cartProName,
      this.cartProPics,
      this.cartProPrice,
      this.cartProSize,
      this.cartProColor,
      this.cartProQty});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // ===========Leading Section================
        leading: Image.asset(
          cartProPics,
          width: 80.0,
          height: 80.0,
        ),
        title: Text(cartProName),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text("Size:"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      cartProSize,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                // this section is for product color
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Color:',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(cartProColor),
                  ),
                ),
              ],
            ),
            // ===========This section is for the product price==========
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '\$$cartProPrice',
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),
        trailing: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  onPressed: () {},
                ),
              ),
            ),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.all(2.0), child: Text('$cartProQty'))),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
