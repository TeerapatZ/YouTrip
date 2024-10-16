import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtrip/Pin/ResetEmail.dart';



class ForgotPinScreen extends StatefulWidget {
  const ForgotPinScreen({super.key});

  @override
  _ForgotPinScreenState createState() => _ForgotPinScreenState();
}

class _ForgotPinScreenState extends State<ForgotPinScreen> {
  final List<TextEditingController> _controllers = List.generate(10, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(10, (_) => FocusNode());
  bool _showButton = false;

  @override
  void initState() {
    super.initState();

    // Listen for changes in all controllers to show button when all inputs are filled
    for (var controller in _controllers) {
      controller.addListener(_checkIfComplete);
    }
  }

  void _checkIfComplete() {
    setState(() {
      // Check if all controllers have text
      _showButton = _controllers.every((controller) => controller.text.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color.fromARGB(255, 109, 55, 166)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title
            const Text(
              'กรุณากรอก Y-Number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 109, 55, 166),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Image (Replace with the appropriate image asset or network image)
            Image.asset(
              'assets/images/11.png', // Update with your asset path
              width: 200,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Instruction Text
            const Text(
              'กรุณาระบุเลข 10 หลัก ที่อยู่ด้านหลังของบัตร',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Custom Text Field for Y-Number
            _buildYNumberInput(),
            const SizedBox(height: 20),
            // Show button when input is complete
            if (_showButton)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResetEmail()), 
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 109, 55, 166),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "ยืนยัน",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            // Spacer for keyboard
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  // Custom Text Field for Y-Number Input
  Widget _buildYNumberInput() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Y - ', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 10),
          SizedBox(
            width: 300, // Fixed width to center the input boxes
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(10, (index) {
                return SizedBox(
                  width: 30,
                  height: 50,
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    autofocus: index == 0,
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 9) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (value.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1), // Limit to 1 digit
                      FilteringTextInputFormatter.digitsOnly, // Only digits allowed
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
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

  @override
  void dispose() {
    // Dispose controllers and focus nodes
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
