import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartList extends StatelessWidget {

  var format = NumberFormat("###.00 €");

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

    return ListView.builder(
        padding: EdgeInsets.all(4.0),
        itemCount: cart.totalItems(),
        itemBuilder: (context, index) {
          var cartItem = cart.getCartItem(index);
          String sousTotal = format.format(cartItem.pizza.total*cartItem.quantity);
          return Row(
            //_buildItem()
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  //width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(color: Colors.blue.shade100,
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Image.network(
                    '${cartItem.pizza.image}',
                    height: 140,
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  //width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height*0.187 ,
                    decoration: BoxDecoration(color: Colors.grey.shade100,
                        border: Border.all(color: Colors.blue.shade100)),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(cartItem.pizza.title, style: PizzeriaStyle.regularTextStyle,),
                        SizedBox(height: 7),
                        //_cartList2(cartItem),
                        Row(
                        children: <Widget>  [
                          Expanded(
                            child: Container(
                              child:
                                Text("${cartItem.pizza.total} €",
                                  style: PizzeriaStyle.regularTextStyle,
                                ),
                              ),
                            ),
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  IconButton(onPressed: () {
                                      {cart.addProduct(cartItem.pizza);                        };
                                    }, icon: const Icon(Icons.add),),
                                  Text('${cartItem.quantity}',
                                    style: PizzeriaStyle.itemPriceTextStye,
                                  ),
                                  IconButton(onPressed: () {
                                    {cart.removeProduct(cartItem.pizza);};
                                    }, icon: const Icon(Icons.remove))
                                ],
                              ),
                            ),
                          )
                        ],
                    ),
                        Text('Sous-total : ${sousTotal}',
                          style: PizzeriaStyle.priceSubTotalTextStyle,),
                        SizedBox(height: 7),
                      ],
                    )
                ),
              ),
            ],
          );
        },
    );
  }

  // POUR  QUESTION - REFACTORING paramètre de method ???

/*  Widget _buildItem(CartItem cartItem) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(color: Colors.blue.shade100,
                border: Border.all(color: Colors.grey.shade300)),
            child: Image.network(
              '${cartItem.pizza.image}',
              height: 140,
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.25,
            //height: MediaQuery.of(context).size.height*0.187 ,
              decoration: BoxDecoration(color: Colors.grey.shade100,
                  border: Border.all(color: Colors.blue.shade100)),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cartItem.pizza.title, style: PizzeriaStyle.regularTextStyle,),
                  SizedBox(height: 7),
                  //_counterPizza(cartItem),
                  _cartList2(),
                  Text('Sous-total : ${cartItem.pizza.total*cartItem.quantity} €',
                    style: PizzeriaStyle.priceSubTotalTextStyle,),
                  SizedBox(height: 7),
                ],
              )
          ),
        ),
      ],
    );
  }*/


  /*@override
  Widget _cartList2(CartItem cartItem) {
    return Row(
      children: <Widget>  [
        Expanded(
          child: Container(
            child:
              Text("${cartItem.pizza.total} €",
                style: PizzeriaStyle.regularTextStyle,),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: [
                IconButton(onPressed: () {
                  {
                  cart.addProduct(cartItem.pizza);
                  };
                  }, icon: const Icon(Icons.add),),
                Text('${cartItem.quantity}',
                    style: PizzeriaStyle.itemPriceTextStye,
              ),
              IconButton(onPressed: () {
                {
                  cart.removeProduct(cartItem.pizza);
                };
                }, icon: const Icon(Icons.remove))
              ],
            ),
          ),
        )
      ],
    );*/

}
