import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final String sign;
  final Color color;

  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.sign,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withAlpha(100),
        child: Icon(Icons.swap_horiz, color: color),
      ),
      title: Text(title),
      trailing: Text(
        "$sign$amount",
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
