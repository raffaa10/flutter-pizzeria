import 'package:flutter/cupertino.dart';
import 'package:pizzeria/models/pizza.dart';

class CartItem {
  
  final Pizza pizza;
  int quantity;
  
  CartItem(this.pizza, [this.quantity = 1]);
  
}

class Cart extends ChangeNotifier {

  List<CartItem> _items = [];
  
  int totalItems() {return _items.length; }

  CartItem getCartItem(int index) {
    return _items[index];
  }
  
  void addProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      _items.add(CartItem(pizza));
    } else {
      CartItem item = _items[index];
      item.quantity++;
    }
    notifyListeners();
  }
  
  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);

    if(_items[index].quantity > 0) {
      CartItem item = _items[index];
      item.quantity--;
      if (item.quantity == 0) {
        _items.removeAt(index);
      }
    }
    notifyListeners();
  }
  
  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.pizza.id == id);
  }

  double totalTTC(Cart cart) {
    double d = 0;
    for(var piz in cart._items) {
      d += piz.pizza.total * piz.quantity ;
    }
    return d;
  }


}