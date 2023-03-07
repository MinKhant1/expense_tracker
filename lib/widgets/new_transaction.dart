import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({required this.addTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final entertedTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    // print('hi');

    if (entertedTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return;
    widget.addTransaction(entertedTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
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
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(child: Text('No Date Chosen')),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(_selectedDate == null
                          ? 'Choose Date'
                          : DateFormat.yMd().format(_selectedDate)))
                ],
              ),
            ),
            ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Transaction'),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.purple))),
          ],
        ),
      ),
    );
  }
}
