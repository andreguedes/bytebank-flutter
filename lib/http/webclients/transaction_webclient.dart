import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(BASE_URL);
    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson
        .map((dynamic json) => (Transaction.fromJson(json)))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    Map<String, dynamic> transactionMap = transaction.toJson();
    final Response response = await client.post(
      BASE_URL,
      headers: {'Content-Type': 'application/json', 'password': password},
      body: jsonEncode(transactionMap),
    );
    if (response.statusCode == 200)
      return Transaction.fromJson(jsonDecode(response.body));

    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode))
      return _statusCodeResponses[statusCode];
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'An error occur submitting a transaction',
    401: 'Authentication failed',
    409: 'Transaction already exists'
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
