import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final repository = MovieRepository();

  test('Repository loads the movie list from JSON', () async {
    final movies = await repository.loadMoviesFromAsset();

    expect(movies, isNotEmpty);
    expect(movies.length, 2);
  });

  test('Repository loads Sinners correctly from JSON', () async {
    final movies = await repository.loadMoviesFromAsset();

    final movie = movies.firstWhere((movie) => movie.id == '1');

    expect(movie.title, 'Sinners');
    expect(movie.ageRating, '15');
    expect(movie.ticketPrice, 10.00);
  });

  test('Repository loads Kraven the Hunter correctly from JSON', () async {
    final movies = await repository.loadMoviesFromAsset();

    final movie = movies.firstWhere((movie) => movie.id == '2');

    expect(movie.title, 'Kraven the Hunter');
    expect(movie.ageRating, '15');
    expect(movie.ticketPrice, 10.00);
  });
}
