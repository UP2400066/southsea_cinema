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
  });
}
