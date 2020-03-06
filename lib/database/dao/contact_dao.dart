import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAO {
  static const CONTACTS_TABLE = 'contacts';
  static const CONTACT_ID = 'id';
  static const CONTACT_NAME = 'name';
  static const CONTACT_ACCOUNT_NUMBER = 'account_number';

  static const String tableSQL = 'CREATE TABLE $CONTACTS_TABLE('
      '$CONTACT_ID INTEGER PRIMARY KEY, '
      '$CONTACT_NAME TEXT, '
      '$CONTACT_ACCOUNT_NUMBER INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    return db.insert(CONTACTS_TABLE, _toMap(contact));
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    return _toList(await db.query(CONTACTS_TABLE));
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[CONTACT_NAME] = contact.name;
    contactMap[CONTACT_ACCOUNT_NUMBER] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[CONTACT_ID],
        row[CONTACT_NAME],
        row[CONTACT_ACCOUNT_NUMBER],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
