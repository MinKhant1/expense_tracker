import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction({required this.addTransaction});

  void submitData() {
    final entertedTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    // print('hi');

    if (entertedTitle.isEmpty || enteredAmount <= 0) return;
    addTransaction(entertedTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
                onPressed: submitData,
                child: Text('Add Transaction'),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.purple))),
          ],
        ),
      ),
    );
  }
}
