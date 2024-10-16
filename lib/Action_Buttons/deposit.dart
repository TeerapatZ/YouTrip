import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  String _enteredAmount = '';
  bool _isButtonEnabled = false;
  bool _isOverMaxLimit = false; // Track if the entered amount exceeds the limit
  final double _maxAmount = 479942.03; // Maximum allowed amount

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_checkIfComplete);
    }
  }

  void _checkIfComplete() {
    setState(() {
      _enteredAmount = _controllers.map((c) => c.text).join(); // Concatenate all input fields' text
      if (_enteredAmount.isNotEmpty) {
        double amount = double.tryParse(_enteredAmount) ?? 0.0;
        _isOverMaxLimit = amount > _maxAmount; // Check if amount exceeds limit
      }
      _isButtonEnabled = _controllers.every((controller) => controller.text.isNotEmpty) && !_isOverMaxLimit;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent the screen from resizing when keyboard opens
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 109, 55, 166), // Purple background
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          title: const Text('เติมเงิน', style: TextStyle(color: Colors.white)),
                          centerTitle: true,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'จำนวนเงิน (THB)',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        _buildAmountInput(),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'เติมได้สูงสุด 479,942.03 THB',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.info, color: Colors.white, size: 20),
                              onPressed: () {
                                _showCustomDialog(context);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 500), // Add some padding to the button area
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Error404()),
                          );
                        }
                      : null, // Disable the button when not all fields are filled
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled
                        ? const Color.fromARGB(255, 109, 55, 166)
                        : Colors.grey, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(300, 50),
                  ),
                  child: const Text(
                    'เติมเงินด้วย K PLUS',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom Text Field for Amount Input
  Widget _buildAmountInput() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          SizedBox(
            width: 350, // Increase the width to make the input fields larger
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 55, // Increase the width of each input field
                  height: 65, // Increase the height of each input field
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    autofocus: index == 0,
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (value.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }
                      _checkIfComplete(); // Check if the input is complete
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: _isOverMaxLimit ? Colors.red : Colors.white, // Set text color to red if exceeds max limit
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1), // Limit to 1 digit
                      FilteringTextInputFormatter.digitsOnly, // Only digits allowed
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3), // Increase border thickness here
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: _isOverMaxLimit ? Colors.red : const Color.fromARGB(255, 135, 194, 158), // Set red border if over max
                          width: 3,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: _isOverMaxLimit ? Colors.red : const Color.fromARGB(255, 135, 194, 158), // Set red border if over max
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Custom dialog that looks like the one in the image
  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'จำนวนเงินที่สามารถเติมได้',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 109, 55, 166), // Purple color for title
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'จำนวนเงินสูงสุดที่สามารถเติมเงินได้ 500,000 บาท เพื่อที่คุณจะสามารถใช้บริการของเราได้อย่างต่อเนื่อง\n\nทั้งนี้จำนวนเงินสูงสุดที่สามารถเติมเงินได้อาจจะน้อยกว่า 500,000 บาท หากคุณมีรายการรอชำระเงินค้างอยู่',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 40, 212, 153),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'ตกลง',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
