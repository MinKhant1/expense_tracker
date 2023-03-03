import 'package:flutter/material.dart';

import '../models/transcation.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transcation> _userTransactions = [
    Transcation(
        id: 't1', title: 'Air Jordan', amount: 600, date: DateTime.now()),
    Transcation(
        id: 't2', title: 'New Laptop', amount: 1300, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transcation(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          addTransaction: _addNewTransaction,
        ),
        TranscationList(
          transactions: _userTransactions,
        ),
      ],
    );
  }
}
