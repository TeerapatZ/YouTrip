import 'package:flutter/material.dart';
import 'package:youtrip/screens/sub_screen/Currencyyyyyyy.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ยอดเงินคงเหลือ',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700),
              ),
              const SizedBox(height: 20),
              // Horizontal Balance Cards and Additional Text
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildBalanceCard('USD', '1500.25'),
                    _buildBalanceCard('THB', '230.00'),
                    _buildBalanceCard('EUR', '800.75'),
                    _buildBalanceCard('JPY', '10000.10'),
                    _buildBalanceCard('HKD', '3000.00'),
                    _buildBalanceCard('AUD', '540.65'),
                    _buildBalanceCard('GBP', '1800.30'),
                    _buildBalanceCard('SGD', '100.00'),
                    _buildBalanceCard('CHF', '2500.80'),
                    _buildBalanceCard('CAD', '400.50'),
                    // Text after balance cards
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Currencyyyyyyy()), 
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: const TextSpan(
                            text: 'อีกมากกว่า 140+ สกุลเงิน',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 255, 170), 
                              fontSize: 16,
                              decoration: TextDecoration.underline, 
                              decorationColor: Color.fromARGB(255, 0, 255, 170), 
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Balance Card Widget
  Widget _buildBalanceCard(String currency, String amount) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.zero, 
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currency,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(amount, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

