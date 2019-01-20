import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> images = [
    "cupcake.jpeg",
    "froyo.jpeg",
    "pie.png",
    "marshmallow.jpeg",
    "ice_cream_sandwich.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Hero Issue"),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
            padding: EdgeInsets.only(bottom: 32.0),
            itemCount: images.length,
            itemBuilder: (BuildContext ctx, int index) {
              return SingleMushroomItem(images[index]);
            }));
  }
}

class SingleMushroomItem extends StatelessWidget {
  final String image;

  SingleMushroomItem(this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ClipRRect(
            borderRadius: new BorderRadius.circular(15.0),
            child: InkWell(
              onTap: () => _navigateToLocationDetailsScreen(context),
              child: Hero(
                tag: image,
                child: Image(
                  image: AssetImage("assets/$image"),
                ),
              ),
            )),
      ),
    );
  }

  void _navigateToLocationDetailsScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PersonalSpotDetailsWidget(image)));
  }
}

class PersonalSpotDetailsWidget extends StatelessWidget {
  // This widget is the root of your application.

  final String _imageTag;

  PersonalSpotDetailsWidget(this._imageTag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 350.0,
              floating: false,
              pinned: true,
              iconTheme: IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: true,
                  background: Hero(
                      tag: _imageTag,
                      child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/$_imageTag")))),
            ),
          ];
        },
        body: Center(child: Text("TESTING")),
      ),
    );
  }
}
