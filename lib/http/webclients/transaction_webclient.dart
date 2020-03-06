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

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = transaction.toJson();
    final Response response = await client.post(
      BASE_URL,
      headers: {'Content-Type': 'application/json', 'password': '1000'},
      body: jsonEncode(transactionMap),
    );
    return Transaction.fromJson(jsonDecode(response.body));
  }
}