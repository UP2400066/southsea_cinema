import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late BasketRepository basketRepository;
  late MovieRepository movieRepository;
  late List<dynamic> movies;

  setUp(() async {
    basketRepository = BasketRepository();
    movieRepository = MovieRepository();

    movies = await movieRepository.loadMoviesFromAsset();
  });

  test('Repository adds a ticket to the basket', () {
    final movie = movies.firstWhere((movie) => movie.id == '1');

    basketRepository.addTicket(movie);

    final items = basketRepository.getBasketItems();

    expect(items.length, 1);
    expect(items.first.movie.title, 'Sinners');
    expect(items.first.quantity, 1);
  });

  test('Adding the same movie twice increases its quantity', () {
    final movie = movies.firstWhere((movie) => movie.id == '1');

    basketRepository.addTicket(movie);
    basketRepository.addTicket(movie);

    final items = basketRepository.getBasketItems();

    expect(items.length, 1);
    expect(items.first.quantity, 2);
  });

  test('Repository removes a ticket from the basket', () {
    final movie = movies.firstWhere((movie) => movie.id == '1');

    basketRepository.addTicket(movie);
    basketRepository.removeTicket(0);

    expect(basketRepository.getBasketItems(), isEmpty);
  });

  test('Repository clears the basket', () {
    final movie1 = movies.firstWhere((movie) => movie.id == '1');
    final movie2 = movies.firstWhere((movie) => movie.id == '2');

    basketRepository.addTicket(movie1);
    basketRepository.addTicket(movie2);

    basketRepository.clearBasket();

    expect(basketRepository.getBasketItems(), isEmpty);
  });
}
