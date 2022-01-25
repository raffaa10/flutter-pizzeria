import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/counter_pizza_widget.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';

class Panier extends StatefulWidget {

  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon panier"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(4.0),
              itemCount: widget._cart.totalItems(),
              itemBuilder: (context, index) {
                return _buildItem(widget._cart.getCartItem(index));
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    child: _tableTotal(),
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
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red.shade800)
                    ),
                    child: Text("Valider le panier",),
                    onPressed: () {
                      print("Valider");
                    },
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(color: Colors.blue.shade100,
                border: Border.all(color: Colors.grey.shade300)),
            child: Image.asset(
              'assets/images/pizzas/${cartItem.pizza.image}',
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
                _counterPizza(cartItem),
                Text('Sous-total : ${cartItem.pizza.total*cartItem.quantity} €',
                  style: PizzeriaStyle.priceSubTotalTextStyle,),
                SizedBox(height: 7),
              ],
            )
          ),
        ),
      ],
    );
  }

  Widget _counterPizza(CartItem cartItem) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(child:
          Text("${cartItem.pizza.total} €", style: PizzeriaStyle.regularTextStyle,),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              children: [
                IconButton(onPressed: () {
                  setState(() {widget._cart.addProduct(cartItem.pizza);});
                  }, icon: const Icon(Icons.add),),
                Text('${cartItem.quantity}', style: PizzeriaStyle.itemPriceTextStye,),
                IconButton(onPressed: () {
                  setState(() {
                    widget._cart.removeProduct(cartItem.pizza);
                  });
                  }, icon: const Icon(Icons.remove))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _tableTotal() {
    return Table(
      border: TableBorder.symmetric(),
      children: [
        TableRow(children: [
          Text(''),
          Text('TOTAL HT',style: PizzeriaStyle.priceSubTotalTextStyle,),
          Text('${widget._cart.totalTTC(widget._cart)*80/100} €', textAlign: TextAlign.center,
            style: PizzeriaStyle.priceSubTotalTextStyle,),
        ]),
        TableRow(children: [
          Text(''),
          Text('TVA',style: PizzeriaStyle.priceSubTotalTextStyle,),
          Text('${widget._cart.totalTTC(widget._cart)*20/100} €', textAlign: TextAlign.center,
            style: PizzeriaStyle.priceSubTotalTextStyle,),

        ]),
        TableRow(
            children: [
              Text(''),
              Text('TOTAL TTC',style: PizzeriaStyle.priceTotalTextStyle,),
              Text('${widget._cart.totalTTC(widget._cart)} €',
                textAlign: TextAlign.center,
                style: PizzeriaStyle.priceTotalTextStyle ,),
            ]
        )
      ],
    );
  }

}
