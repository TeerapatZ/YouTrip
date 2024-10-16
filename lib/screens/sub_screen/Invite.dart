import 'package:flutter/material.dart';
import 'package:youtrip/Action_Buttons/sub_Action_uttons/confirm.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  _InviteScreenState createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 55, 166),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'ชวนเพื่อนใช้ YouTrip',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),

          // Icon and decoration at the top
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/66.png',
                width: screenWidth * 0.9, 
                height: screenWidth * 0.6,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Description text
          const Text(
            'เพียงชวนเพื่อนมาใช้ YouTrip ทั้งคุณและเพื่อนจะได้รับโบนัสคนละ THB100 ฟรี! หลังจากที่เพื่อนของคุณใช้จ่ายผ่าน YouTrip ครั้งแรกไม่มีขั้นต่ำ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),

          const Text(
            'โบนัสสูงสุดถึง THB0 (ชวนเพื่อนได้สูงสุด 0 คน)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Error404()),
              );
            },
            child: const Text(
              'ข้อกำหนดและเงื่อนไข',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'ชวนเพื่อนมาใช้เลย!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 20),

          // Share button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Error404()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 188, 148),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'แชร์ลิงก์',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 350),

          // Bonus status
          const Text(
            'โบนัสสะสม: THB 0',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
