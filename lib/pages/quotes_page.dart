import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tronald_dump/components/quote_card.dart';
import 'dart:convert';

class QuotesPage extends StatefulWidget {
  final String tag;

  QuotesPage({this.tag});

  @override
  State<StatefulWidget> createState() {
    return QuotesPageState(tag: this.tag);
  }
}

class QuotesPageState extends State<QuotesPage> {
  final String imageApiUrl =
      'https://pixabay.com/api/?key=12092672-bf3442924e3064e3f7d0926c8&q=';
  final String tag;

  String imageUrl =
      'https://pixabay.com/get/eb35b10a2bf0023ed1584d05fb1d4794e37ee0d31eb30c4090f5c57aa0eab1b9d8_1280.png';

  List quotes;

  QuotesPageState({this.tag});

  @override
  void initState() {
    super.initState();

    this.getImageUrl();
    this.getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          topContent(),
          bottomContent(),
        ],
      ),
    );
  }

  Widget topContent() {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(this.imageUrl),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText(),
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget bottomContent() {
    return Flexible(
      child: ListView.builder(
        itemCount: quotes == null ? 0 : quotes.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return QuoteCard(quote: quotes[index]);
        },
      ),
    );
  }

  getImageUrl() async {
    var response = await http.get(
      Uri.encodeFull(this.imageApiUrl + this.tag),
      headers: {"Accept": "application/json"},
    );

    var result = json.decode(response.body);
    List images = result['hits'];

    if (images.length > 0) {
      setState(() {
        imageUrl = images[0]['largeImageURL'];
      });
    }
  }

  getQuotes() async {
    var response = await http.get(
      Uri.encodeFull('https://api.tronalddump.io/tag/${this.tag}'),
      headers: {"Accept": "application/hal+json"},
    );

    var result = json.decode(response.body);

    setState(() {
      quotes = result['_embedded']['tags'];
    });
  }

  Widget topContentText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          this.tag,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
      ],
    );
  }
}
