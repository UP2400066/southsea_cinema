import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  final repository = MovieRepository();

  test('Repository returns the movie list', () {
    final movies = repository.getMovies();

    expect(movies, isNotEmpty);
    expect(movies.length, greaterThanOrEqualTo(2));
  });

  test('Repository returns a movie with an existing ID', () {
    final movie = repository.getMovieById('1');

    expect(movie, isNotNull);
    expect(movie!.id, '1');
    expect(movie.title, 'Sinners');
  });

  test('Repository returns null for a missing movie ID', () {
    final movie = repository.getMovieById('999');

    expect(movie, isNull);
  });
}
