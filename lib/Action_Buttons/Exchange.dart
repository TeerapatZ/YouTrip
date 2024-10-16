import 'package:flutter/material.dart';
import 'sub_Action_uttons/confirm.dart'; // อิมพอร์ต ConfirmScreen

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  final PageController _pageControllerFrom = PageController(viewportFraction: 0.35);
  final PageController _pageControllerTo = PageController(viewportFraction: 0.35);
  int _currentIndexFrom = 0;
  int _currentIndexTo = 0;

  // Sample balances for each currency
  final Map<String, double> balances = {
    'USD': 1500.25,
    'THB': 230.00,
    'EUR': 800.75,
    'JPY': 10000.10,
    'HKD': 3000.00,
    'AUD': 540.65,
    'GBP': 1800.30,
    'SGD': 100.00,
    'CHF': 2500.80,
    'CAD': 400.50,
  };

  // List of currency codes
  final List<String> currencies = [
    'USD',
    'THB',
    'EUR',
    'JPY',
    'HKD',
    'AUD',
    'GBP',
    'SGD',
    'CHF',
    'CAD'
  ];

  // Exchange rates (from each currency to other currencies)
final Map<String, Map<String, double>> exchangeRates = {
  'USD': {
    'USD': 1.00,
    'THB': 36.00,
    'EUR': 0.95,
    'JPY': 150.25,
    'HKD': 7.83,
    'AUD': 1.57,
    'GBP': 0.81,
    'SGD': 1.36,
    'CHF': 0.91,
    'CAD': 1.34,
  },
  'THB': {
    'USD': 0.028,
    'THB': 1.00,
    'EUR': 0.026,
    'JPY': 4.17,
    'HKD': 0.22,
    'AUD': 0.043,
    'GBP': 0.023,
    'SGD': 0.038,
    'CHF': 0.025,
    'CAD': 0.037,
  },
  'EUR': {
    'USD': 1.05,
    'THB': 38.00,
    'EUR': 1.00,
    'JPY': 157.89,
    'HKD': 8.20,
    'AUD': 1.64,
    'GBP': 0.85,
    'SGD': 1.43,
    'CHF': 0.96,
    'CAD': 1.40,
  },
  'JPY': {
    'USD': 0.0067,
    'THB': 0.24,
    'EUR': 0.0063,
    'JPY': 1.00,
    'HKD': 0.052,
    'AUD': 0.010,
    'GBP': 0.0055,
    'SGD': 0.0091,
    'CHF': 0.0061,
    'CAD': 0.0093,
  },
  'HKD': {
    'USD': 0.13,
    'THB': 4.57,
    'EUR': 0.12,
    'JPY': 19.16,
    'HKD': 1.00,
    'AUD': 0.20,
    'GBP': 0.10,
    'SGD': 0.17,
    'CHF': 0.12,
    'CAD': 0.17,
  },
  'AUD': {
    'USD': 0.64,
    'THB': 22.98,
    'EUR': 0.61,
    'JPY': 95.54,
    'HKD': 4.98,
    'AUD': 1.00,
    'GBP': 0.51,
    'SGD': 0.86,
    'CHF': 0.58,
    'CAD': 0.86,
  },
  'GBP': {
    'USD': 1.23,
    'THB': 44.16,
    'EUR': 1.17,
    'JPY': 181.23,
    'HKD': 9.74,
    'AUD': 1.97,
    'GBP': 1.00,
    'SGD': 1.64,
    'CHF': 1.13,
    'CAD': 1.67,
  },
  'SGD': {
    'USD': 0.73,
    'THB': 27.07,
    'EUR': 0.66,
    'JPY': 110.38,
    'HKD': 5.74,
    'AUD': 1.16,
    'GBP': 0.61,
    'SGD': 1.00,
    'CHF': 0.67,
    'CAD': 1.00,
  },
  'CHF': {
    'USD': 1.10,
    'THB': 39.78,
    'EUR': 1.04,
    'JPY': 161.56,
    'HKD': 8.60,
    'AUD': 1.75,
    'GBP': 0.88,
    'SGD': 1.49,
    'CHF': 1.00,
    'CAD': 1.51,
  },
  'CAD': {
    'USD': 0.75,
    'THB': 26.96,
    'EUR': 0.71,
    'JPY': 110.00,
    'HKD': 5.86,
    'AUD': 1.17,
    'GBP': 0.61,
    'SGD': 1.02,
    'CHF': 0.67,
    'CAD': 1.00,
  },
};

  // Build balance card
  Widget _buildBalanceCard(
      String currency, String balance, bool isCenter, Color centerColor) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      width: isCenter ? 180 : 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            currency,
            style: TextStyle(
              color: isCenter ? centerColor : Colors.grey,
              fontSize: isCenter ? 35 : 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          if (isCenter)
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'คุณมีเงินอยู่ ',
                    style: TextStyle(
                      color: centerColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$balance $currency',
                    style: TextStyle(
                      color: centerColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String fromCurrency = currencies[_currentIndexFrom];
    String toCurrency = currencies[_currentIndexTo];
    double exchangeRate = exchangeRates[fromCurrency]?[toCurrency] ?? 1.0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 109, 55, 166),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 4.0),
            child: Text('แลกเงิน',
                style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
          centerTitle: true,
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // "จาก" Section
              Container(
                color: const Color.fromARGB(255, 109, 55, 166),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                child: Column(
                  children: [
                    const Text('จาก', style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 120,
                      child: PageView.builder(
                        controller: _pageControllerFrom,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndexFrom = index;
                          });
                        },
                        itemCount: currencies.length,
                        itemBuilder: (context, index) {
                          return _buildBalanceCard(
                            currencies[index],
                            balances[currencies[index]].toString(),
                            index == _currentIndexFrom,
                            Colors.white,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // "เป็น" Section
              const Text('เป็น', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              SizedBox(
                height: 120,
                child: PageView.builder(
                  controller: _pageControllerTo,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndexTo = index;
                    });
                  },
                  itemCount: currencies.length,
                  itemBuilder: (context, index) {
                    return _buildBalanceCard(
                      currencies[index],
                      balances[currencies[index]].toString(),
                      index == _currentIndexTo,
                      Colors.black,
                    );
                  },
                ),
              ),

              // "ต่อไป" Button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmScreen(
                          fromCurrency: currencies[_currentIndexFrom],
                          toCurrency: currencies[_currentIndexTo],
                          exchangeRate: exchangeRates[currencies[_currentIndexFrom]]?[currencies[_currentIndexTo]] ?? 1.0,
                          balances: balances, // ส่ง balances ไปยัง ConfirmScreen
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                          color: Color.fromARGB(255, 40, 212, 153), width: 2),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shadowColor: Colors.transparent,
                  ).copyWith(
                    backgroundColor: WidgetStateProperty.resolveWith(
                        (states) => states.contains(WidgetState.pressed)
                            ? const Color.fromARGB(255, 40, 212, 153)
                            : Colors.transparent),
                  ),
                  child: const Center(
                    child: Text(
                      'ต่อไป',
                      style: TextStyle(
                          color: Color.fromARGB(255, 40, 212, 153),
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
          Positioned(
            top: 150,
            left: 120,
            right: 120,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 75, 75),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '1 $fromCurrency แลกได้ $exchangeRate $toCurrency',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
