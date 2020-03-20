import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:flutter/material.dart';

class AppDependencies extends InheritedWidget {
  final ContactDAO contactDAO;

  AppDependencies({
    @required this.contactDAO,
    @required Widget child,
  }) : super(child: child);

  static AppDependencies of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependencies>();
  }

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    // ignore: unrelated_type_equality_checks
    return contactDAO != oldWidget;
  }
}
