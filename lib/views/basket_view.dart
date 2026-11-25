import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/reusable_button.dart';

class BasketView extends StatefulWidget {
  const BasketView({
    super.key,
    required this.basketRepository,
  });

  final BasketRepository basketRepository;

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  Widget build(BuildContext context) {
    final items = widget.basketRepository.getBasketItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket'),
      ),
      body: Column(
        children: [
          Expanded(
            child: items.isEmpty
                ? const Center(
                    child: Text(
                      'Your basket is empty',
                      style: TextStyle(
                        color: cinemaFontWhite,
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return ListTile(
                        title: Text(item.movie.title),
                        subtitle: Text(
                          'Quantity: ${item.quantity} '
                          '• Price: ${item.movie.formattedPrice} each',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              widget.basketRepository.removeTicket(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Total: £${widget.basketRepository.getTotal().toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: cinemaFontWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SquaredButton(
                  label: 'Clear Basket',
                  onPressed: () {
                    setState(() {
                      widget.basketRepository.clearBasket();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
