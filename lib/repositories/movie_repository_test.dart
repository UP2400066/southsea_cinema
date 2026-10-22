
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository', () {
    final repository = MovieRepository();

    test('returns the movie list', () {
      final movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('finds a movie by ID', () {
      final movie = repository.getMovieById('1');

      expect(movie, isNotNull);
      expect(movie!.title, 'Sinners');
    });

    test('returns null for an unknown ID', () {
      final movie = repository.getMovieById('999');

      expect(movie, isNull);
    });
  });
}
