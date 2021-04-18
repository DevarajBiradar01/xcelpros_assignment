import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String strButtonName;
  ButtonWidget(this.strButtonName);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(
              2.0,
              2.0,
            ),
            blurRadius: 10.0,
          ), //BoxShadow
        ],
      ),
      child: Text(
        strButtonName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
