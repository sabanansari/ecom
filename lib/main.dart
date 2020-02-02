import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/components/horizontal_listview.dart';
import 'package:ecommerce/components/products.dart';
import 'package:ecommerce/pages/carts.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 250.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('FashApp'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Shaban Ansari'),
                accountEmail: Text('shabanansari@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                )),
            DrawerMenu(
              title: 'Home Page',
              icon: Icons.home,
              onTap: () {},
            ),
            DrawerMenu(
              title: 'My Account',
              icon: Icons.person,
              onTap: () {},
            ),
            DrawerMenu(
              title: 'My Orders',
              icon: Icons.shopping_basket,
              onTap: () {},
            ),
            DrawerMenu(
              title: 'Shopping Cart',
              icon: Icons.shopping_cart,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
            DrawerMenu(
              title: 'Favorites',
              icon: Icons.favorite,
              onTap: () {},
            ),
            Divider(),
            DrawerMenu(
                title: 'Settings',
                icon: Icons.settings,
                onTap: () {},
                colors: Colors.blueGrey),
            DrawerMenu(
                title: 'About',
                icon: Icons.help,
                onTap: () {},
                colors: Colors.blueGrey),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          image_carousel,
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Categories',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          HorizontalList(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Products',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //gridView
          Flexible(
            child: Products(),
          )
        ],
      ),
    );
  }
}
