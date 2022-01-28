import 'package:flutter/cupertino.dart';
import 'package:pizzeria/models/cart.dart';
import 'package:pizzeria/ui/share/pizzeria_style.dart';
import 'package:provider/provider.dart';

class CartTotal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      //height: 220,
      child: Consumer<Cart>(
          builder: (context, cart, child) {
            final double _total = cart.totalTTC(cart);
            if (_total == 0) {
              return Center(
                child: Text('Aucun produit',
                  style: PizzeriaStyle.priceTotalTextStyle,
                ),
              );
            } else {
              // ignore: dead_code
              return Column(
                  children: [
                    Table(
                      border: TableBorder.symmetric(),
                      children: [
                        TableRow(children: [
                          Text(''),
                          Text('TOTAL HT',
                            style: PizzeriaStyle.priceSubTotalTextStyle,),
                          Text('${cart.totalTTC(cart) * 80 /100} €',
                            textAlign: TextAlign.center,
                            style: PizzeriaStyle.priceSubTotalTextStyle,),
                        ]),
                        TableRow(children: [
                          Text(''),
                          Text('TVA',
                            style: PizzeriaStyle.priceSubTotalTextStyle,),
                          Text('${cart.totalTTC(cart) * 20 / 100} €',
                            textAlign: TextAlign.center,
                            style: PizzeriaStyle.priceSubTotalTextStyle,),
                        ]),
                        TableRow(
                            children: [
                              Text(''),
                              Text('TOTAL TTC',
                                style: PizzeriaStyle.priceTotalTextStyle,),
                              Text('${cart.totalTTC(cart)} €',
                                textAlign: TextAlign.center,
                                style: PizzeriaStyle.priceTotalTextStyle,),
                            ]
                        ),
                      ],
                    ),
                  ]
              );
          };
        }
      ),
    );
  }

}