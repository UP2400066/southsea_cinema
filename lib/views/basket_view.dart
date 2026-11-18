import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
      ),
      body: const Center(
        child: Text(
          'Your basket is empty',
          style: TextStyle(
            color: cinemaFontWhite,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}