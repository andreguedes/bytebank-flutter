class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        accountNumber = json['accountNumber'];

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }

  Map<String, dynamic> tojson() =>
      {'name': name, 'accountNumber': accountNumber};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          accountNumber == other.accountNumber;

  @override
  int get hashCode => name.hashCode ^ accountNumber.hashCode;
}
