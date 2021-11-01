// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //const Chartbar({Key? key}) : super(key: key);

  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      FittedBox(
        //to avoid text wrap and shink the text if out of space.
        child: Text('\u{20B9}${spendingAmount.toStringAsFixed(0)},'),
      ),
      SizedBox(height: 4),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10), //for rounded corners
              ),
            ),
            FractionallySizedBox(
              widthFactor: spendingPctOfTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 4),
      Text(label),
    ]);
  }
}
