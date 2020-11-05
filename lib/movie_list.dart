import 'package:flutter/material.dart';
import 'http_helper.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  HttpHelper helper;
  int moviesCount;
  List movies;

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Movies'),),
        body: ListView.builder (
            itemCount: (this.moviesCount==null) ? 0 : this.moviesCount,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                color: Colors.white,
                elevation: 5.0,
                child: ListTile(
                  title: Text(movies[position].title),
                  subtitle: Text('Released: ${movies[position].releaseDate}\n'
                      +  'Rating: ${movies[position].voteAverage.toString()}'
                  ),
                ),
              );
            })
    );
  }

  Future initialize() async {
    movies = List();
    movies = await helper.getUpcoming();
    if (movies == null) {
      initialize();
    }
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

}
