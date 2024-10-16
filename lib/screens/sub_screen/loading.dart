import 'package:flutter/material.dart';
import '../../Pin/PIN.dart'; 

void main() => runApp(const Loading());

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Start with the splash screen
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isGreen = false;
  bool _showText = false;
  bool _showLogo = false;
  bool _fadeSpinner = false;

  @override
  void initState() {
    super.initState();

    // Trigger the display of the loading spinner
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isGreen = false; // Ensure the loading spinner is showing initially
      });
    });

    // Fade out the spinner
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _fadeSpinner = true; // Start fading out the spinner
      });
    });

    // Change color and move the logo up
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isGreen = true; // Start the background transition
      });
    });

    // Show the 'Powered by' text
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _showText = true;
      });
    });

    // Show the KBank logo
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _showLogo = true;
      });
    });

    // Navigate to the PIN input screen after a total of 7 seconds
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PinInputScreen()), // Navigate to the PIN screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2), // Duration for background color transition
        color: _isGreen
            ? const Color.fromARGB(255, 135, 194, 158)
            : const Color.fromARGB(255, 109, 55, 166),
        child: Stack(
          children: [
            // Main content in the center
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Animated padding for main logo
                  AnimatedPadding(
                    duration: const Duration(seconds: 2), // Duration for logo movement
                    curve: Curves.easeInOut, // Smooth easing curve
                    padding: EdgeInsets.only(top: _isGreen ? 0 : 150), // Move logo up when _isGreen
                    child: Image.asset(
                      'assets/images/youT.png', 
                      width: 200, 
                      height: 150,
                    ),
                  ),
                  // Animated opacity for 'Powered by' text
                  AnimatedOpacity(
                    opacity: _showText ? 1.0 : 0.0, // Fade in effect for text
                    duration: const Duration(seconds: 1), // Duration for fading effect
                    curve: Curves.easeIn, // Easing curve for smooth fade-in
                    child: const Text(
                      'Powered by',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  // Animated opacity for KBank logo
                  AnimatedOpacity(
                    opacity: _showLogo ? 1.0 : 0.0, // Fade in effect for logo
                    duration: const Duration(seconds: 1), // Duration for fading effect
                    curve: Curves.easeIn, // Easing curve for smooth fade-in
                    child: Image.asset(
                      'assets/images/kbank2.png', 
                      width: 250, 
                      height: 250,
                    ),
                  ),
                ],
              ),
            ),
            // Spinner at the bottom
            Positioned(
              bottom: 40, // Place the spinner at the bottom
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _fadeSpinner ? 0.0 : 1.0, // Fade out the spinner
                duration: const Duration(seconds: 1),
                child: !_isGreen // Show only if _isGreen is false
                    ? const Center(
                        child: SizedBox(
                          width: 40, 
                          height: 40, 
                          child: CircularProgressIndicator(
                            strokeWidth: 5, 
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 94, 252, 178), // Set the spinner color to green
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
