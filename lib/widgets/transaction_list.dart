import 'package:flutter/material.dart';
import '../models/transcation.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transactions;
  TranscationList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('Transactions is Empty'),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //                 color: Theme.of(context).primaryColor,
                //                 width: 2)),
                //         child: Text(
                //           '\$${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //               color: Theme.of(context).primaryColor),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[index].title,
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold, fontSize: 15),
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(
                //                 color: Theme.of(context).primaryColor,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 15),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
              // children: transactions.map((tx) {
              //   return Card(
              //     child: Row(
              //       children: <Widget>[
              //         Container(
              //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //           padding: EdgeInsets.all(10),
              //           decoration: BoxDecoration(
              //               border: Border.all(color: Colors.purple, width: 2)),
              //           child: Text(
              //             '\$${tx.amount}',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 20,
              //                 color: Colors.purple),
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               tx.title,
              //               style:
              //                   TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              //             ),
              //             Text(
              //               DateFormat.yMMMd().format(tx.date),
              //               style: TextStyle(
              //                   color: Colors.grey,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 15),
              //             )
              //           ],
              //         )
              //       ],
              //     ),
              //   );
              // }).toList(),
            ),
    );
  }
}
