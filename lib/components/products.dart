import 'package:flutter/material.dart';
import 'package:ecommerce/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 230,
      "price": 160,
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 230,
      "price": 160,
    },
    {
      "name": "Blazer",
      "picture": "images/products/dress1.jpeg",
      "old_price": 230,
      "price": 160,
    },
    {
      "name": "Blazer",
      "picture": "images/products/dress2.jpeg",
      "old_price": 230,
      "price": 160,
    },
    {
      "name": "Blazer",
      "picture": "images/products/hills2.jpeg",
      "old_price": 230,
      "price": 160,
    },
    {
      "name": "Blazer",
      "picture": "images/products/pants1.jpg",
      "old_price": 230,
      "price": 160,
    },
    {
      "name": "Blazer",
      "picture": "images/products/shoe1.jpg",
      "old_price": 230,
      "price": 160,
    },
    {
      "name": "Blazer",
      "picture": "images/products/skt2.jpeg",
      "old_price": 230,
      "price": 160,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            name: productList[index]['name'],
            pictures: productList[index]['picture'],
            oldPrice: productList[index]['old_price'],
            price: productList[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final name;
  final pictures;
  final oldPrice;
  final price;

  SingleProduct({this.name, this.pictures, this.oldPrice, this.price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                    //passing details of product to productDetails page
                    productName: name,
                    productNewPrice: price,
                    productOldPrice: oldPrice,
                    productPicture: pictures,
                  ))),
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Text(
                  '\$$price',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                subtitle: Text('\$$oldPrice',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.lineThrough,
                    )),
              ),
            ),
            child: Image.asset(
              pictures,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
