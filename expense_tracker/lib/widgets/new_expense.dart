import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitInput() {
    final enteredAmt = double.tryParse(_amountController.text);
    final validAmt = enteredAmt == null || enteredAmt <= 0;

    if (_titleController.text.trim().isEmpty ||
        validAmt ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text('Please enter all the fields.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Okey"))
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmt,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpcae = MediaQuery.of(context).viewInsets.bottom;

    Widget titleText = TextField(
      controller: _titleController,
      maxLength: 50,
      decoration: const InputDecoration(
        label: Text('Title'),
      ),
    );
    Widget amountText = Expanded(
      child: TextField(
        controller: _amountController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixText: '\$ ',
          label: Text('Amount'),
        ),
      ),
    );
    Widget datePicker = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _selectedDate == null
                ? 'no date selected'
                : formatter.format(_selectedDate!),
          ),
          IconButton(
            onPressed: _presentDatePicker,
            icon: const Icon(Icons.calendar_month),
          )
        ],
      ),
    );
    Widget dropDownButton = DropdownButton(
      value: _selectedCategory,
      items: Category.values
          .map(
            (category) => DropdownMenuItem(
              value: category,
              child: Text(category.name.toUpperCase()),
            ),
          )
          .toList(),
      onChanged: (val) {
        if (val == null) {
          return;
        }
        setState(() {
          _selectedCategory = val;
        });
      },
    );

/*
    return LayoutBuilder(
      builder: (ctx, constrain) {
        final width = constrain.maxWidth;

        print(constrain.maxWidth);
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpcae + 16),
              child: Column(
                children: [
                  if (width > 600)
                    Row(
                      children: [
                        titleText,
                        const SizedBox(
                          width: 20,
                        ),
                        amountText
                      ],
                    )
                  else
                    titleText,
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      amountText,
                      const SizedBox(
                        width: 50,
                      ),
                      datePicker,
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      dropDownButton,
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: _submitInput,
                        child: const Text("Save"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
*/

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpcae + 16),
          child: Column(
            children: [
              titleText,
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  amountText,
                  const SizedBox(
                    width: 50,
                  ),
                  datePicker,
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  dropDownButton,
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _submitInput,
                    child: const Text("Save"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
