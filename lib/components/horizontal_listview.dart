import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Category>[
          Category(
              imageLocation: 'images/cats/tshirt.png', imageCaption: 'T-Shirt'),
          Category(
            imageLocation: 'images/cats/dress.png',
            imageCaption: 'Dress',
          ),
          Category(
            imageLocation: 'images/cats/formal.png',
            imageCaption: 'Formal',
          ),
          Category(
            imageLocation: 'images/cats/informal.png',
            imageCaption: 'Informal',
          ),
          Category(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: 'Jeans',
          ),
          Category(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: 'Shoes',
          ),
          Category(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: 'Accesories',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category(
      {this.imageLocation = 'images/cats/informal.png',
      this.imageCaption = 'Informal'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102.0,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: InkWell(
          onTap: () {},
          child: ListTile(
            enabled: true,
            title: Image.asset(
              imageLocation,
              height: 50.0,
              width: 50.0,
            ),
            subtitle: Text(
              imageCaption,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
