import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/Models/movie.dart';

void main() {
  group('Movie model', () {
    test('formats whole-pound prices correctly', () {
      final movie = Movie(
        id: '1',
        title: 'Test Movie',
        synopsis: 'Test synopsis',
        ageRating: '12A',
        runtime: '120 minutes',
        screeningTime: '19:00',
        ticketPrice: 7.0,
        posterPath: 'assets/images/Sinners.jpg',
      );

      expect(movie.formattedPrice, '£7.00');
    });

    test('formats prices with pence correctly', () {
      final movie = Movie(
        id: '2',
        title: 'Another Test Movie',
        synopsis: 'Test synopsis',
        ageRating: '15',
        runtime: '100 minutes',
        screeningTime: '20:00',
        ticketPrice: 7.5,
        posterPath: 'assets/images/kraven_the_hunter.jpg',
      );

      expect(movie.formattedPrice, '£7.50');
    });

        test('stores movie details correctly', () {
      final movie = Movie(
        id: '1',
        title: 'Sinners',
        synopsis: 'A test synopsis',
        ageRating: '15',
        runtime: '2hrs 17m',
        screeningTime: '18:00',
        ticketPrice: 10.0,
        posterPath: 'assets/images/sinners.jpg',
      );

      expect(movie.id, '1');
      expect(movie.title, 'Sinners');
      expect(movie.synopsis, 'A test synopsis');
      expect(movie.ageRating, '15');
      expect(movie.runtime, '2hrs 17m');
      expect(movie.screeningTime, '18:00');
      expect(movie.ticketPrice, 10.0);
      expect(movie.posterPath, 'assets/images/sinners.jpg');
    });
  });
}


