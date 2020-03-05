import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
                decoration: InputDecoration(labelText: 'Full name'),
                style: TextStyle(fontSize: 16.0)),
            TextField(
              decoration: InputDecoration(labelText: 'Account number'),
              style: TextStyle(fontSize: 16.0),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {

                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
