import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/cart_item.dart';

//we are defining cart items
class PCartItem {
  //we are defining how the cart will look like
  final String id;
  final String title;
  final int quantity;
  final double price;

  PCartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  //we are managing the cart items
  //we want to map every cart item to the id of the product that it belongs
  //since the cart id is different than the id of the product
  Map<String, PCartItem> _items = {};

  int get itemCount {
    return _items.length;
  }

//we are creating a getter for the total ammount that will be used in the cart_screen
  double get totalAmmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  //we want to get the items that are in the cart from the items in the products
  Map<String, PCartItem> get items {
    return {..._items};
  }

  //we want to be able to add an item
  void addItem(String productId, double price, String title) {
    //we first need to check if we have the specific item in our cart
    //if yes we need to increment the quantity
    //if not we need toadd it
    if (_items.containsKey(productId)) {
      //change the quantity
      _items.update(
          productId,
          (existingCartItem) => PCartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1));
    } else {
      //we are creating a new cart item
      _items.putIfAbsent(
        productId,
        () => PCartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => PCartItem(
          id: existingCartItem.id,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
          title: existingCartItem.title,
        ),
      );
    } else {
      _items.remove(productId);
      notifyListeners();
    }
  }

  void clear() {
    //we are setting _items to an empty Map
    _items = {};
    notifyListeners();
  }
}
