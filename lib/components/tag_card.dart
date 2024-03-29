import 'package:flutter/material.dart';
import 'package:tronald_dump/pages/quotes_page.dart';

class TagCard extends StatelessWidget {
  final String title;

  TagCard({this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: listTitle(context),
      ),
    );
  }

  Widget listTitle(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
          border: new Border(
            right: new BorderSide(
              width: 1.0,
              color: Colors.white24,
            ),
          ),
        ),
        child: Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        this.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Icon(
            Icons.linear_scale,
            color: Colors.yellowAccent,
          ),
          Text(
            " Intermediate",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        size: 30.0,
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return QuotesPage(tag: this.title);
        }));
      },
    );
  }
}
