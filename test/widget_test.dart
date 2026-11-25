import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/Models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

class FakeMovieRepository extends MovieRepository {
  @override
  Future<List<Movie>> loadMoviesFromAsset() async {
    return [
      Movie(
        id: '1',
        title: 'Sinners',
        synopsis: 'A test movie',
        ageRating: '15',
        runtime: '2hrs 17m',
        screeningTime: '18:00',
        ticketPrice: 10.00,
        posterPath: 'assets/images/sinners.jpg',
      ),
    ];
  }
}

void main() {
  testWidgets(
    'Home page displays title, movie cards and booking buttons',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        SouthseaCinemaApp(
          basketRepository: BasketRepository(),
          movieRepository: FakeMovieRepository(),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
      expect(find.byType(MovieCard), findsWidgets);
      expect(find.text('BOOK NOW'), findsWidgets);
    },
  );

  testWidgets(
    'Book Now opens the selected movie listing',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        SouthseaCinemaApp(
          basketRepository: BasketRepository(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MovieCard), findsWidgets);

      await tester.tap(find.text('BOOK NOW').first);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Add to order'), findsOneWidget);
    },
  );
}
