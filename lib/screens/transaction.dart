import 'package:flutter/material.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'รายการล่าสุด',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 10),
          _buildTransactionItem(context, Icons.swap_horiz, 'แลกเงิน',
              '1,000.00 THB to 200.00 USD', '2 วันที่แล้ว'),
          _buildTransactionItem(context, Icons.account_balance_wallet_outlined,
              'เติมเงิน', '+ 6,000.00 THB', '4 วันที่แล้ว'),
          _buildTransactionItem(context, Icons.swap_horiz, 'แลกเงิน',
              '1,000.00 THB to 200.00 USD', '6 วันที่แล้ว'),
          _buildTransactionItem(context, Icons.account_balance_wallet_outlined,
              'เติมเงิน', '+ 6,000.00 THB', '1 อาทิตย์ที่แล้ว'),
          _buildTransactionItem(context, Icons.account_balance_wallet_outlined,
              'เติมเงิน', '+ 5,000.00 THB', '2 อาทิตย์ที่แล้ว'),
          _buildTransactionItem(context, Icons.account_balance_wallet_outlined,
              'เติมเงิน', '+ 3,000.00 THB', '3 อาทิตย์ที่แล้ว'),
          _buildTransactionItem(context, Icons.account_balance_wallet_outlined,
              'เติมเงิน', '+ 2,000.00 THB', '1 เดือนที่แล้ว'),
          _buildTransactionItem(context, Icons.account_balance_wallet_outlined,
              'เติมเงิน', '+ 1,000.00 THB', '2 เดือนที่แล้ว'),
        ],
      ),
    );
  }

  // Transaction Item Widget
  Widget _buildTransactionItem(BuildContext context, IconData icon, String title,
      String description, String date) {
    return GestureDetector(
      onTap: () {
        // Show popup dialog when tapping on transaction item
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: const EdgeInsets.all(20),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon at the top
                  Icon(
                    icon,
                    size: 50,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('รายละเอียด:'),
                  Text(description),
                  const SizedBox(height: 10),
                  Text('วันที่: $date'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ปิด'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey.shade700),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(description),
                ],
              ),
            ),
            Text(date, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
