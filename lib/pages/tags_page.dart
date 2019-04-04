import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tronald_dump/components/tag_card.dart';
import 'dart:convert';

import 'package:tronald_dump/components/top_app_bar.dart';
import 'package:tronald_dump/components/bottom_tab_bar.dart';

class TagsPage extends StatefulWidget {
  final String title;

  TagsPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TagsPageState(title: this.title);
  }
}

class TagsPageState extends State<TagsPage> {
  final String title;
  List data;

  TagsPageState({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: TopAppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: this.title,
      ),
      body: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return TagCard(title: data[index]);
          }),
          bottomNavigationBar: BottomTabBar(),
    );
  }

  getTags() async {
    var response = await http.get(
      Uri.encodeFull('https://api.tronalddump.io/tag'),
      headers: {"Accept": "application/hal+json"},
    );

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['_embedded'];

      print(data);
    });
  }

  @override
  void initState() {
    super.initState();

    // Call the getJSONData() method when the app initializes
    this.getTags();
  }
}
