import 'dart:convert';

import 'package:flutter/services.dart';
import '../Models/movie.dart';

class MovieRepository {
  Future<List<Movie>> loadMoviesFromAsset() async {
    final jsonString = await rootBundle.loadString(
      'assets/data/movies.json',
    );

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList
        .map((json) => Movie.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

