import 'package:flutter/material.dart';
import 'package:ecommerce/main.dart';

class ProductDetails extends StatefulWidget {
  final productName;
  final productNewPrice;
  final productOldPrice;
  final productPicture;

  ProductDetails(
      {this.productName,
      this.productNewPrice,
      this.productOldPrice,
      this.productPicture});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  IconData iconData = Icons.favorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: Text('FashApp')),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.productPicture)),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$${widget.productOldPrice}',
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '\$${widget.productNewPrice}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // <<<<<<<<< The First Buttons >>>>>>>>>
          Row(
            children: <Widget>[
              // :::::::: The Size Button :::::::::
              DetailButton(
                detail: 'Size',
                text: 'size',
              ),
              DetailButton(
                detail: 'Color',
                text: 'color',
              ),
              DetailButton(
                detail: 'Qty',
                text: 'quantity',
              ),
            ],
          ),
          // :::::::::: the second button :::::::
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text('Buy Now'),
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    iconData,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    if (iconData == Icons.favorite_border) {
                      iconData = Icons.favorite;
                    } else {
                      iconData = Icons.favorite_border;
                    }
                  },
                ),
              ),
            ],
          ),
          Divider(),
          ListTile(
            title: Text('Product Details'),
            subtitle: Text('fldsfdk fjad skgfjd fgfgkfdv lf dbkf g jgdkgfkg'
                'gkfg fg kfkgjfkg j fkg jfkg jfkgj fk gjfk dgjfkg jkf jgfjg'
                'fg kfjg k fjgkfjgkl fjgkl fj gkfg'),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Name',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.productName),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Brand',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('Brand X'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Condition',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text('New'),
              ),
            ],
          ),
          Divider(),
          Padding(
              padding: EdgeInsets.all(8.0), child: Text('Similar Products')),

          //Similar Products Section
          Flexible(
            child: SimilarProducts(),
          )
        ],
      ),
    );
  }
}

class DetailButton extends StatelessWidget {
  final detail;
  final text;
  DetailButton({this.detail, this.text});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('$text'),
                  content: Text('Choose the $text'),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'close',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                );
              });
        },
        color: Colors.white,
        textColor: Colors.grey,
        elevation: 0.2,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(detail),
            ),
            Expanded(child: Icon(Icons.arrow_drop_down))
          ],
        ),
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
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SimilarSingleProduct(
            name: productList[index]['name'],
            pictures: productList[index]['picture'],
            oldPrice: productList[index]['old_price'],
            price: productList[index]['price'],
          );
        });
  }
}

class SimilarSingleProduct extends StatelessWidget {
  final name;
  final pictures;
  final oldPrice;
  final price;

  SimilarSingleProduct({this.name, this.pictures, this.oldPrice, this.price});
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
