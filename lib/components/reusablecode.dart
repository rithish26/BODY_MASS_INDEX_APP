import 'package:flutter/material.dart';
import '../screens/input_page.dart';

class reusablecode extends StatelessWidget {
  reusablecode( {this.colour, this.cardchild,this.onpress});
  final Color colour;
  final Widget cardchild;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),

        ),

      ),
    );
  }
}

