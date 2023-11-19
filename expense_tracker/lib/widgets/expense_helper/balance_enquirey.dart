import 'package:expense_tracker/models/expense_storage.dart';
import 'package:flutter/material.dart';

class BalanceEnquirey extends StatefulWidget {
  const BalanceEnquirey(this.totalSpend, {super.key});
  final double totalSpend;

  @override
  State<BalanceEnquirey> createState() {
    return _BalanceEnquireyState();
  }
}

class _BalanceEnquireyState extends State<BalanceEnquirey> {
  var balanceSet = false;

  final ExpenseStorage _expenseStorage = ExpenseStorage();
  double balance = 0.0;
  final _budgetController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadBalanceToSp();

    balanceSet = true;
  }

  Future<void> _saveBalanceToSP() async {
    await _expenseStorage.saveBalance(balance);
  }

  // Function to load expenses
  Future<void> _loadBalanceToSp() async {
    final loadedBalance = await _expenseStorage.loadBalance();
    setState(() {
      balance = loadedBalance;
    });
  }

  void _setBudget() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => budgetText(),
    );
  }

  void _saveBalance() {
    double? enterAmt = double.tryParse(_budgetController.text);

    if (enterAmt != null) {
      setState(() {
        balanceSet = true;
        balance = enterAmt;
        _saveBalanceToSP();
      });
    } else {
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
    Navigator.pop(context);
  }

  Widget budgetText() {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text('New Budget'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(onPressed: _saveBalance, child: const Text('Save'))
          ],
        ),
      ),
    );
  }

  Widget _addBalanceWidget() => Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _setBudget,
              icon: const Icon(Icons.add_comment),
            ),
            const Text("Set Budget")
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            if (!balanceSet)
              _addBalanceWidget()
            else
              Column(
                children: [
                  Text(
                    'Budget : \$${balance.toString()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(240, 96, 59, 181),
                    ),
                  ),
                  Text(
                    'Remaining : \$${(balance - widget.totalSpend).toString()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(240, 96, 59, 181),
                    ),
                  ),
                ],
              ),
            if (balanceSet) const Spacer(),
            IconButton(onPressed: _setBudget, icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
