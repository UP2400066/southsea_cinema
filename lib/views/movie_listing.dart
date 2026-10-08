import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

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
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        child: Column(
          children: [
            const Text('Sinners'),

            const Text('A short description of Sinners goes here'),
            
            const Text('Director: Ryan Coogler'),
            const Text('Genre: Horror, Thriller, Drama'),
            const Text('Duration: 2hrs 17 minutes'),

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
                DropdownMenuEntry(value: 1, label: 'Tickett 1'),
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
