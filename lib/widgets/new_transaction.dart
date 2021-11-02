// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({Key? key}) : super(key: key);
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
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
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleController,
              onSubmitted: (_) => _submitData(), //for the validation
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType
                  .number, //for IOS use TextInputType.numberWithOptions(decimal:true)
              onSubmitted: (_) => _submitData(), //for the validation
            ),
            Container(
              height: 70.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _datePicker),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                "Add Expense",
                style:
                    TextStyle(color: Theme.of(context).textTheme.button!.color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
