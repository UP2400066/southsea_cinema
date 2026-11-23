
import '../Models/basket_item.dart';
import '../Models/movie.dart';

class BasketRepository {
  final List<BasketItem> _items = [];

  void addTicket(Movie movie) {
    for (final item in _items) {
      if (item.movie.id == movie.id) {
        item.quantity++;
        return;
      }
    }

    _items.add(
      BasketItem(
        movie: movie,
        quantity: 1,
      ),
    );
  }

  void removeTicket(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
    }
  }

  void clearBasket() {
    _items.clear();
  }

  List<BasketItem> getBasketItems() {
    return List.unmodifiable(_items);
  }

  double getTotal() {
    double total = 0;

    for (final item in _items) {
      total += item.movie.ticketPrice * item.quantity;
    }

    return total;
  }
}
