import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp(contactDAO: ContactDAO()));
}

class ByteBankApp extends StatelessWidget {
  final ContactDAO contactDAO;

  ByteBankApp({@required this.contactDAO});

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      contactDAO: contactDAO,
      child: MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.green[900],
              accentColor: Colors.blueAccent[700],
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.blueAccent[700],
                textTheme: ButtonTextTheme.primary,
              )),
          home: Dashboard()),
    );
  }
}
