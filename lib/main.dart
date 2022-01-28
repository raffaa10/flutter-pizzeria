import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria/ui/panier.dart';
import 'package:pizzeria/ui/pizza_list.dart';
import 'package:pizzeria/ui/share/appbar_widget.dart';
import 'package:pizzeria/ui/share/bottom_nav_bar_widget.dart';
import 'models/cart.dart';
import 'models/menu.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
      ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzeria',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Notre pizzeria'),
      routes: {
        //'/profil': (context) => Profil(),
        '/panier': (context) => Panier(),
        '/pizza_list': (context) => PizzaList(new Cart()), // Routing vers PizzaList
      },
    );
  }
}


class MyHomePage extends StatelessWidget {
  String title;
  Cart _cart;
  MyHomePage({required this.title, Key? key}) :
        _cart = Cart(),
        super(key: key);

  var _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png',Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png',Colors.brown),
    Menu(4, 'Boissons', 'boisson.png',Colors.lightBlue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title, _cart),
      body: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              switch (_menus[index].type) {
                case 2:
                  Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => PizzaList(_cart))
                  );
                  break;
              }
            },
            child: _buildRow(_menus[index]),
          ),
          itemExtent: 180,
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(_cart.totalItems()),
    );
  }

  _buildRow(Menu menu) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: menu.color,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
        Expanded(
          child: Image.asset(
            'assets/images/menus/${menu.image}',
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          height: 50,
          child: Center(
            child: Text(
              menu.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Robot',
                fontSize: 28,
              ),
            ),
          ),
        ),
        ],
      )
    );
  }

}






