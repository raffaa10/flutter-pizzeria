import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:provider/provider.dart';

import 'badge_widget.dart';

class BottomNavBarWidget extends StatelessWidget {

  final int indexSelected;
  const BottomNavBarWidget(this.indexSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();
    var _totalItems = cart.totalItems();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: indexSelected,
      backgroundColor: Colors.grey.shade400,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart_outlined,),
          label: 'Commande',
        ),
        BottomNavigationBarItem(
          icon: _totalItems == 0
              ? Icon(Icons.shopping_cart_outlined)
              : BadgeWidget(
                child: Icon(Icons.shopping_cart),
                value: _totalItems,
                top:0, right: 0,
              ),
          label: "Panier",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      onTap: (index) {
        String page = '/';
        switch (index) {
          case 2:
            page = '/panier';
            break;
          case 3:
            page = '/profil';
            break;
          case 1:
            page = '/pizza_list'; // QUESTION ??? No routing à cause du paramètre de Constructeur ??
            break;
        }
        Navigator.pushNamed(context, page);
      },
    );
  }
}
