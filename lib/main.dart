import 'package:flutter/material.dart';
import 'package:tronald_dump/pages/tags_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tronald Dump',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: TagsPage(title: 'Tags'),
    );
  }
}