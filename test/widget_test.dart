
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

void main() {
  testWidgets(
    'Home page displays title, movie cards and booking buttons',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        SouthseaCinemaApp(
          basketRepository: BasketRepository(),
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

      await tester.tap(find.text('BOOK NOW').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Add to order'), findsOneWidget);
    },
  );
}
