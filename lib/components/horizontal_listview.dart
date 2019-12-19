import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/cats/home.png',
            imageCaption: 'House',
          ),
          Category(
            imageLocation: 'images/cats/tower.png',
            imageCaption: 'Tower',
          ),
          Category(
            imageLocation: 'images/cats/bridge.png',
            imageCaption: 'Bridge',
          ),
          Category(
            imageLocation: 'images/cats/dam.png',
            imageCaption: 'Dam',
          ),
          Category(
            imageLocation: 'images/cats/road.png',
            imageCaption: 'Road',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                imageLocation,
                width: 100.0,
                height: 80.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  imageCaption,
                  style: new TextStyle(fontSize: 12.0),
                ),
              )),
        ),
      ),
    );
  }
}
