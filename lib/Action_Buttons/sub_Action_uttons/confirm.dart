import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class ConfirmScreen extends StatefulWidget {
  final String fromCurrency;
  final String toCurrency;
  final double exchangeRate;
  final Map<String, double> balances;

  const ConfirmScreen({
    super.key,
    required this.fromCurrency,
    required this.toCurrency,
    required this.exchangeRate,
    required this.balances,
  });

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  double fromAmount = 0.0;
  double toAmount = 0.0;
  final TextEditingController _fromAmountController = TextEditingController();
  bool isAmountOverBalance = false; // To track if input exceeds balance

  @override
  void initState() {
    super.initState();
    _fromAmountController.addListener(() {
      setState(() {
        fromAmount = double.tryParse(_fromAmountController.text) ?? 0.0;
        toAmount = fromAmount * widget.exchangeRate;

        // Check if entered amount exceeds balance
        isAmountOverBalance = fromAmount > (widget.balances[widget.fromCurrency] ?? 0.0);
      });
    });
  }

  @override
  void dispose() {
    _fromAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 55, 166),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ระบุจำนวนเงิน',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // "จาก" Section
          Container(
            color: const Color.fromARGB(255, 109, 55, 166),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Column(
              children: [
                _buildCurrencySection('จาก', widget.fromCurrency, _fromAmountController, color: Colors.white),
                const SizedBox(height: 10),
                _buildBalanceInfo(widget.balances[widget.fromCurrency] ?? 0.0, widget.fromCurrency),
                const SizedBox(height: 5),
                _buildExchangeRateInfo(widget.fromCurrency, widget.toCurrency),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // "เป็น" Section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildResultSection('เป็น', widget.toCurrency, toAmount),
                const SizedBox(height: 5),
                _buildBalanceInfo(widget.balances[widget.toCurrency] ?? 0.0, widget.toCurrency),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Add the SlideAction Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: _buildSlideAction(),
          ),
        ],
      ),
    );
  }

  // Build the currency section widget
  Widget _buildCurrencySection(String label, String currency, TextEditingController controller, {required Color color}) {
    return Column(
      children: [
        // แสดง 'จาก <currency>'
        Text('$label $currency', style: TextStyle(fontSize: 16, color: color)),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: isAmountOverBalance ? Colors.red : color, // สีแดงเมื่อเกิน balance
          ),
          decoration: InputDecoration(
            hintText: '0.00',
            hintStyle: TextStyle(color: color.withOpacity(0.5)),
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: isAmountOverBalance ? Colors.red : Colors.grey, // เส้นสีแดงเมื่อเกิน balance
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: isAmountOverBalance ? Colors.red : Colors.green, // เส้นสีเขียวเมื่อโฟกัสและไม่เกิน balance
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Display balance information
  Widget _buildBalanceInfo(double balance, String currency) {
    return Text(
      'คุณมีเงินอยู่ ${balance.toStringAsFixed(2)} $currency',
      style: const TextStyle(fontSize: 14, color: Colors.white),
    );
  }

  // Display exchange rate information
  Widget _buildExchangeRateInfo(String fromCurrency, String toCurrency) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 72, 41, 104),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Text(
        '1 $fromCurrency แลกได้ ${widget.exchangeRate.toStringAsFixed(2)} $toCurrency',
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  // Display result amount in "เป็น" section
  Widget _buildResultSection(String label, String currency, double amount) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 10),
        Text(
          amount.toStringAsFixed(2),
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text(
          currency,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  // Build the slide action button
  Widget _buildSlideAction() {
    bool isEnabled = fromAmount > 0 && !isAmountOverBalance; // Disable if exceeds balance

    return SlideAction(
      outerColor: isEnabled
          ? const Color.fromARGB(255, 40, 212, 153) // สีเขียวเมื่อเปิดใช้งาน
          : Colors.grey, // สีเทาเมื่อปิดใช้งาน
      sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.white),
      text: 'เลื่อนเพื่อแลกเงิน', // ข้อความที่แสดงบน Slide Button
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      enabled: isEnabled,
      onSubmit: isEnabled
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Error404()),
              );
              return null;
            }
          : null,
    );
  }
}

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error 404 NOT FOUND')),
      body: const Center(child: Text('Error 404 NOT FOUND screen!')),
    );
  }
}
