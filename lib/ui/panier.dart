import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria/ui/share/bottom_nav_bar_widget.dart';
import 'package:pizzeria/ui/share/cart_list.dart';
import 'package:pizzeria/ui/share/cart_total.dart';


class Panier extends StatelessWidget {

  const Panier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Mon panier"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CartList(),
            )
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    child: CartTotal(),
                  )
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.all(4.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red.shade800)
                      ),
                      child: Text("Valider le panier",),
                      onPressed: () {
                        print("Valider");
                      },
                    ),
                  ),
                ],
              )
          ),
          BottomNavBarWidget(2), // QUESTION ????? routing ?
        ],
      ),
    );
  }
}

