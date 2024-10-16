import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:
              const Icon(Icons.close, color: Color.fromARGB(255, 109, 55, 166)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 20),

            // Title
            const Center(
              child: Text(
                'ถอนเงินสดต่างประเทศ',
                style: TextStyle(
                  color: Color.fromARGB(255, 109, 55, 166),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ATM Image
            Image.asset(
              'assets/images/77.png',
              width: screenWidth * 0.7,
              height: screenWidth * 0.6,
            ),
            const SizedBox(height: 20),

            // Description Text
            const Text(
              'หากคุณต้องการเงินสดระหว่างเดินทาง คุณสามารถถอนเงินสดได้มากกว่า 150 สกุลเงินทั่วโลกในอัตราแลกเปลี่ยนที่ดีที่สุด ง่ายๆ เพียงแค่',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),

            const Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Color.fromARGB(255, 165, 253, 199),
                  child: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'สอดบัตร YouTrip เข้า ตู้ ATM ต่างประเทศ ที่มีสัญลักษณ์ MasterCard, Maestro หรือ Cirrus',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            const Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Color.fromARGB(255, 165, 253, 199),
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'ใช้รหัส Card PIN 4 หลัก ที่ตั้งค่าไว้เพื่อถอนเงิน',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Fee Information
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ค่าธรรมเนียมถอนเงินสด: ฟรี!',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'หมายเหตุ: อาจมีค่าธรรมเนียมถอนเงินที่ผู้ให้บริการตู้ ATM ต่างประเทศเรียกเก็บ กรุณาตรวจสอบที่หน้าจอตู้ ATM ก่อนยืนยันทำรายการ',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
