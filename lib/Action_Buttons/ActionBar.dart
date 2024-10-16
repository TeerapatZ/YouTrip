import 'package:flutter/material.dart';
import 'package:youtrip/Action_Buttons/Card.dart';
import 'package:youtrip/Action_Buttons/Exchange.dart';
import 'package:youtrip/Action_Buttons/deposit.dart';



class ActionBar extends StatelessWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 130,
      left: 30,
      right: 30,
      child: Container(
        transform: Matrix4.translationValues(0, -25, 0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActionButton(
              context,
              icon: Icons.account_balance_wallet_outlined,
              label: 'เติมเงิน',
              fillColor: const Color.fromARGB(255, 239, 214, 243),
              iconColor: const Color.fromARGB(255, 109, 55, 166),
              iconSize: 25,
              fontSize: 12,
              targetScreen: const DepositScreen(),
            ),
            _buildActionButton(
              context,
              icon: Icons.swap_horiz,
              label: 'แลกเงิน',
              fillColor: const Color.fromARGB(255, 222, 243, 222),
              iconColor: const Color.fromARGB(255, 94, 252, 178),
              iconSize: 25,
              fontSize: 12,
              targetScreen: const ExchangeScreen(),
            ),
            _buildActionButton(
              context,
              icon: Icons.credit_card_outlined,
              label: 'บัตร',
              fillColor: const Color.fromARGB(255, 235, 204, 186),
              iconColor: const Color.fromARGB(255, 233, 108, 36),
              iconSize: 25,
              fontSize: 12,
              targetScreen: const CardScreen(), 
            ),
          ],
        ),
      ),
    );
  }

  // Action Buttons with Filled Circle and Custom Icon Color
  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color fillColor,
    required Color iconColor,
    required double iconSize,
    required double fontSize,
    required Widget targetScreen, 
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: fillColor,
            ),
            child: Icon(icon, size: iconSize, color: iconColor),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}

