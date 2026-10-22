import '../Models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        id: '1',
        title: 'Sinners',
        synopsis: 'Twin brothers Smoke and Stack return to their hometown to start a new life, hoping to leave their troubled past behind. As they work to build a fresh future, they discover that a terrifying evil is waiting for them. Their plans quickly turn into a fight for survival as dark forces threaten the town and everyone they care about.',
        ageRating: '15',
        runtime: '2hrs 17m',
        screeningTime: '18:00',
        ticketPrice: 10.00,
        posterPath: 'assets/images/sinners.jpg',
      ),
      Movie(
        id: '2',
        title: 'Kraven the Hunter',
        synopsis:
            'Sergei Kravinoff is a skilled hunter whose difficult relationship with his ruthless father shapes his path through life. After a series of events gives him extraordinary abilities, Sergei becomes Kraven, a powerful hunter driven by instinct, strength and a desire to prove himself. As he faces dangerous enemies and confronts his past, he must decide what kind of man he wants to become.',
        ageRating: '15',
        runtime: '2hrs 7m',
        screeningTime: '20:00',
        ticketPrice: 10.00,
        posterPath: 'assets/images/kraven_the_hunter.jpg',
      ),
    ];
  }


Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }

    return null;
  }
}
