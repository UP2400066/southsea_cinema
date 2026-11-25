import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';
import 'package:southsea_cinema/views/settings_view.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

void main() {
  final basketRepository = BasketRepository();

  runApp(
    SouthseaCinemaApp(
      basketRepository: basketRepository,
    ),
  );
}

class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({
    super.key,
    required this.basketRepository,
  });

  final BasketRepository basketRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Southsea Cinema & Arts Centre',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: cinemaSurface,
          iconTheme: IconThemeData(color: cinemaBrand),
          titleTextStyle: cinemaHeaderStyle,
          elevation: 0,
        ),
        scaffoldBackgroundColor: cinemaBackground,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: cinemaBrand,
          primary: const Color.fromARGB(255, 37, 96, 114),
          surface: cinemaSurface,
        ),
        cardTheme: CardThemeData(
          color: cinemaSurface,
          elevation: 2,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(
          basketRepository: basketRepository,
        ),
        
        '/listing': (context) {
          return FutureBuilder(
            future: MovieRepository().loadMoviesFromAsset(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError || !snapshot.hasData) {
                return const Scaffold(
                  body: Center(child: Text('Unable to load films')),
                );
              }

              return MovieListing(
                movie: snapshot.data!.first,
                basketRepository: basketRepository,
              );
            },
          );
        },
        '/basket': (context) => BasketView(
          basketRepository: basketRepository,
        ),
        '/settings': (context) => const SettingsView(),
      },
    );
  }
}
