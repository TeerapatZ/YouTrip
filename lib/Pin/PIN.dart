import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:youtrip/Pin/forgot.dart';
import 'package:youtrip/screens/screen.dart';

class PinInputScreen extends StatefulWidget {
  const PinInputScreen({super.key});

  @override
  _PinInputScreenState createState() => _PinInputScreenState();
}

class _PinInputScreenState extends State<PinInputScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String _enteredPin = '';
  final int _pinLength = 6;
  String _pressedKey = ''; // Track which key is pressed

  // Method to authenticate using Face ID
  Future<void> _authenticateWithFaceID() async {
    try {
      // Check if the device supports biometrics or Face ID
      bool canAuthenticate = await auth.canCheckBiometrics || await auth.isDeviceSupported();

      if (canAuthenticate) {
        bool authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to access the app',
          options: const AuthenticationOptions(
            biometricOnly: true, // Correct parameter usage
          ),
        );

        if (authenticated) {
          // Navigate to the main screen after successful authentication
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        } else {
          // Handle failed authentication
          print("Authentication failed");
        }
      } else {
        // Show an error or fallback to PIN/Password if biometrics are not available
        print("Biometric authentication is not available");
      }
    } catch (e) {
      // Handle any errors
      print('Error during authentication: $e');
    }
  }

  void _onNumberPressed(String number) {
    if (_enteredPin.length < _pinLength) {
      setState(() {
        _enteredPin += number;
        _pressedKey = ''; // Reset the pressed key once tapped
      });

      // Check if the PIN is complete
      if (_enteredPin.length == _pinLength) {
        // Navigate to the main screen (screen.dart)
        Future.delayed(const Duration(milliseconds: 700), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        });
      }
    }
  }

  void _onDeletePressed() {
    if (_enteredPin.isNotEmpty) {
      setState(() {
        _enteredPin = _enteredPin.substring(0, _enteredPin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 55, 166), // Purple background
      body: Center( // Center the entire content
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensure the Column takes minimal space
            crossAxisAlignment: CrossAxisAlignment.center, // Center everything horizontally
            children: [
              // Title
              const Text(
                'กรุณาใส่รหัส App PIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              // Display PIN circles
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _pinLength,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: index < _enteredPin.length ? Colors.white : Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Numeric keypad centered
              _buildKeyPad(),
              const SizedBox(height: 40),
              // Face ID option
              TextButton.icon(
                onPressed: _authenticateWithFaceID, 
                icon: const Icon(Icons.fingerprint, color: Colors.white),
                label: const Text(
                  'เข้าใช้งานด้วย Fingerprint',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeyPad() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Keypad rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKey('1'),
            const SizedBox(width: 20),
            _buildKey('2'),
            const SizedBox(width: 20),
            _buildKey('3'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKey('4'),
            const SizedBox(width: 20),
            _buildKey('5'),
            const SizedBox(width: 20),
            _buildKey('6'),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKey('7'),
            const SizedBox(width: 20),
            _buildKey('8'),
            const SizedBox(width: 20),
            _buildKey('9'),
          ],
        ),
        const SizedBox(height: 20),
        // Last row for "Forgot PIN?", 0, and backspace
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Navigate to the ForgotPinScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPinScreen()),
                    );
                  },
                  child: const Text(
                    'ลืมรหัสผ่าน?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            _buildKey('0'),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: _onDeletePressed,
                  icon: const Icon(Icons.backspace, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildKey(String number) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _pressedKey = number; // Track the pressed key
        });
      },
      onTapUp: (_) {
        _onNumberPressed(number); // Trigger the button action
      },
      onTapCancel: () {
        setState(() {
          _pressedKey = ''; // Reset the pressed key on cancel
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _pressedKey == number ? Colors.grey : Colors.white.withOpacity(0.2), // Flash grey on press
        ),
        padding: const EdgeInsets.all(8.0), // Increase touch area
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent, // Make the CircleAvatar transparent to show AnimatedContainer color
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
