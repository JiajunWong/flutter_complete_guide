import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_complete_guide/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'No transaction added yet',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : Column(
            children: transactions.map((transaction) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(6),
                        child:
                            FittedBox(child: Text('\$${transaction.amount}'))),
                  ),
                  title: Text(
                    transaction.title!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transaction.date!),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(transaction.id),
                  ),
                ),
              );
            }).toList(),
          );
  }
}
