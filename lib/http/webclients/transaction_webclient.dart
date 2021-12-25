import 'dart:convert';

import 'package:mybank/models/transaction.dart';
import 'package:http/http.dart';

import '../webclient.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(Uri.parse(baseUrl));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(const Duration(seconds: 2));

    final Response response = await client.post(Uri.parse(baseUrl),
        headers: {"Content-type": "application/json", "password": password},
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String? _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
  }

  static final Map<int, String> _statusCodeResponses = {
    400: "Transfer amount not entered",
    401: "Wrong password",
    409: "Transaction already exists"
  };
}

class HttpException implements Exception {
  final String? message;

  HttpException(this.message);
}