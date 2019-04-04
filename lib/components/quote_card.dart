import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuoteCard extends StatelessWidget {
  final quote;

  QuoteCard({this.quote});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, .9)),
        child: listTitle(context),
      ),
    );
  }

  Widget listTitle(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Icon(
        Icons.format_quote,
        color: Colors.grey,
        size: 30.0,
      ),
      title: Text(
        quote['value'],
        style: TextStyle(
          color: Color.fromRGBO(64, 75, 96, .9),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      subtitle: Container(
        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
        child: Text(
          getDateTime(quote['created_at']),
          style: TextStyle(
            color: Color.fromRGBO(64, 75, 96, .6),
          ),
        ),
      ),
    );
  }

  String getDateTime(String date) {
    var format = DateFormat("EEEE d y 'om' HH:mm 'uur'");

    return format.format(DateTime.parse(date));
  }
}
