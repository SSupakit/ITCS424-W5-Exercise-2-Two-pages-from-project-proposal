import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        key: UniqueKey(), // Provide a key argument here
        title: 'Product layout demo home page',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Listing")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            ProductBox(
              key: UniqueKey(), // Provide a key argument here
              name: "Furina",
              description: "Furina is the stylist character ever",
              price: 1000,
              image: "furina.png",
            ),
            ProductBox(
              key: UniqueKey(), // Provide a key argument here
              name: "Jingliu",
              description: "Jingliu is the most featureful character ever",
              price: 800,
              image: "Jingliu.png",
            ),
            ProductBox(
              key: UniqueKey(), // Provide a key argument here
              name: "Lynx",
              description: "Lynx is most productive character",
              price: 2000,
              image: "Lynx.png",
            ),
            ProductBox(
              key: UniqueKey(), // Provide a key argument here
              name: "March7th",
              description:
                  "March7th is the most useful character ever for meeting",
              price: 1500,
              image: "March7th.png",
            ),
            ProductBox(
              key: UniqueKey(), // Provide a key argument here
              name: "Silverwolf",
              description: "Silverwolf is useful storage medium",
              price: 100,
              image: "Silverwolf.png",
            ),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {required Key key,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/appimages/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}
