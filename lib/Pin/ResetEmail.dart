import 'package:flutter/material.dart';
import 'PIN.dart'; 

class ResetEmail extends StatelessWidget {
  const ResetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Forgot Password"),
        centerTitle: true, // Center the title in the app bar
      ),
      body: Center( // Use Center to wrap all content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              // Spacer to push content down slightly
              const Spacer(flex: 1),
              // Welcome Text
              const WelcomeText(
                title: "Reset Password sent",
                text: "We have sent a Reset Password to your email.",
              ),
              const SizedBox(height: 20), 
              // Button to navigate back to PIN screen
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 109, 55, 166),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50), // Increase button height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Navigate back to the PIN screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const PinInputScreen()),
                    (Route<dynamic> route) => false, // Remove all previous routes
                  );
                },
                child: const Text("กลับไปหน้า Login"),
              ),
              // Spacer to push content up slightly
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  final String title, text;

  const WelcomeText({super.key, required this.title, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center, // Center the text
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          textAlign: TextAlign.center, // Center the text
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
