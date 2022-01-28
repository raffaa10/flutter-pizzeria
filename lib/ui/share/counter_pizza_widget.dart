import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

class CounterPizzaWidget extends StatelessWidget {

  final CartItem _cartItem;
  
  const CounterPizzaWidget(this._cartItem, {Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(child: Text("${_cartItem.pizza.price} €"),),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: [
                IconButton(onPressed: () {
                  _cartItem.quantity++;
                  }, icon: const Icon(Icons.add),),
                Text('${_cartItem.quantity}', style: PizzeriaStyle.itemPriceTextStye,),
                IconButton(onPressed: () {
                  if(_cartItem.quantity > 0)
                    _cartItem.quantity--;
                  //setState(() {});
                  }, icon: const Icon(Icons.remove))
              ],
            ),
          ),
        )
      ],
    );
  }

 }

