import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 48.0, letterSpacing: 32.0),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {},
          child: Text('Confirm'),
        )
      ],
    );
  }
}
