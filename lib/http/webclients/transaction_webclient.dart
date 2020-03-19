import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(BASE_URL).timeout(Duration(seconds: 5));
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
    if (response.statusCode == 400) throw Exception('An error occur submitting a transaction');
    if (response.statusCode == 401) throw Exception('Authentication failed');
    return Transaction.fromJson(jsonDecode(response.body));
  }
}
