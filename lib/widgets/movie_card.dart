
import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            movie.posterPath,
            height: 200,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              movie.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: cinemaFontWhite,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Age rating: ${movie.ageRating}',
                  style: const TextStyle(color: cinemaFontWhite),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.synopsis,
                  style: const TextStyle(color: cinemaFontWhite),
                ),
                const SizedBox(height: 8),
                Text(
                  'Screening time: ${movie.screeningTime}',
                  style: const TextStyle(color: cinemaFontWhite),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Booking ${movie.title}');
                    },
                    child: const Text('Book Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
