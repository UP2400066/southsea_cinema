
import 'package:flutter/material.dart';
import '../Models/movie.dart';
import '../constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  movie.title.toUpperCase(),
                  style: const TextStyle(
                    color: cinemaBrand,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '(${movie.ageRating})',
                style: const TextStyle(
                  color: cinemaFontMuted,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                movie.posterPath,
                width: 135,
                height: 205,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  movie.synopsis,
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            'BOOK TICKETS',
            style: TextStyle(
              color: cinemaFontWhite,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Text(
                  movie.screeningTime,
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 16,
                  ),
                ),
                onPressed: () {
                  debugPrint('Booking ${movie.title}');
                },
                child: const Text('BOOK NOW'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
