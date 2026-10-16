
import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/Models/movie.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingFeedback = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
        ),
        backgroundColor: const Color.fromARGB(255, 113, 139, 205),
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: cinemaBrandDark,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 16),

            Image.asset(
              widget.movie.posterPath,
              height: 200,
              fit: BoxFit.contain,
            ),

            Text(
              widget.movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(widget.movie.synopsis),

            Text('Age rating: ${widget.movie.ageRating}'),

            Text('Duration: ${widget.movie.runtime}'),

            Text('Screening time: ${widget.movie.screeningTime}'),

            Text(
              'Ticket price: ${widget.movie.formattedPrice}',
            ),

            DropdownMenu<int>(
              initialSelection: 1,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                  });
                }
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 1, label: 'Ticket 1'),
                DropdownMenuEntry(value: 2, label: 'Ticket 2'),
                DropdownMenuEntry(value: 3, label: 'Ticket 3'),
                DropdownMenuEntry(value: 4, label: 'Ticket 4'),
                DropdownMenuEntry(value: 5, label: 'Ticket 5'),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bookingFeedback =
                      '$_ticketQuantity tickets added to your order';
                });
              },
              child: const Text('Add to order'),
            ),

            Text(_bookingFeedback),
          ],
        ),
      ),
    );
  }
}
