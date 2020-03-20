import 'package:bytebank/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return the value when create one transaction', () {
    final Transaction transaction = Transaction(null, 200.0, null);
    expect(transaction.value, 200.0);
  });

  test('should show error when create transaction with value less then zero',
      () {
    expect(() => Transaction(null, 0, null), throwsAssertionError);
  });
}
