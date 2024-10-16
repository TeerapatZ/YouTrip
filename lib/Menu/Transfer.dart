import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _controller = TextEditingController();
  double enteredAmount = 0.0;
  bool isInputNotEmpty = false; // Track if input is not empty

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 55, 166),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'โอนเงินเข้าบัญชีธนาคาร',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Purple section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 109, 55, 166), // Purple background
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'จำนวนเงิน (THB)',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                // Numeric input field with permanent underline
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      isInputNotEmpty = value.isNotEmpty; // Track input change
                      enteredAmount = double.tryParse(value) ?? 0.0;
                    });
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // Default underline
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: isInputNotEmpty ? Colors.green : Colors.grey, // Green when not empty, grey otherwise
                      ),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green), // Green when focused
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'สามารถโอนเงินได้สูงสุด 0 THB',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              const Text(
                'โอนเงินเข้าบัญชี xxx-x-x0000-x',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 30),
              Image.asset(
                'assets/images/kbank2.png',
                width: 120,
                height: 120,
              ),
            ],
          ),
          const SizedBox(height: 10),

          const Text(
            'หมายเหตุ: การโอนเงินออกจาก YouTrip เข้าบัญชีธนาคารจะใช้เวลาภายใน 2 วัน\n(ไม่นับรวมวันทำรายการ)',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 30),

          // Slide button
          _buildSlideAction(),
        ],
      ),
    );
  }

  // Build the slide action button
  Widget _buildSlideAction() {
    bool isEnabled = enteredAmount > 0;

    return SlideAction(
      outerColor:
          isEnabled ? const Color.fromARGB(255, 165, 253, 199) : Colors.grey,
      sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.white),
      text: 'เลื่อนไปเพื่อโอนเงิน',
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      enabled: isEnabled,
      onSubmit: isEnabled
          ? () {
              // Perform action when slide is complete
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
