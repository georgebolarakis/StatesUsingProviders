import 'package:flutter/cupertino.dart';

import './cart.dart';

class OrderItem {
  final String id;
  final double ammount;
  final List<PCartItem> products;
  final DateTime time;

  OrderItem({
    @required this.id,
    @required this.ammount,
    @required this.products,
    @required this.time,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
//we are getting a copy that returns our orders
//by creating a new list and using the spread operator to take some items and move them here
  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<PCartItem> cartProducts, double total) {
    //insert adds them at the begining of the list
    //add adds them at the end of the list
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        ammount: total,
        products: cartProducts,
        time: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
