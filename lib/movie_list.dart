import 'package:flutter/material.dart';
import 'http_helper.dart';


class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  String result;
  HttpHelper helper;

  @override
  void initState() {
    helper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    helper.getUpcoming().then((value) => setState(
        () {
          result = value;
        }
    ));
    return Scaffold(
      appBar: AppBar(title: Text('Movies'),),
      body: Container(
        child: Text(result),
      ),
    );
  }
}
