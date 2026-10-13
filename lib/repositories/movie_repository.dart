
import '../models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        id: '1',
        title:'Sinners',
        synopsis: 'Two brothers return home and face a terrifying evil.',
        ageRating: '15',
        runtime: '2hrs 17m',
        screeningTime: '18:00',
        ticketPrice: 10.00,
        posterPath: 'assets/images/sinners.png',
        ),
        Movie(
          id: '2',
          title: 'Kraven the Hunter',
          synopsis: 'A hunter develops extraordinary abilities and faces dangerous enemies.',
          ageRating: '15',
          runtime: '2hrs 7m',
          screeningTime: '20:00',
          ticketPrice: 10.00,
          posterPath: 'assets/images/kraven_the_hunter.png',
        ),
    ];
  }
}