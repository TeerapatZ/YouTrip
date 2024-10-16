import 'package:flutter/material.dart';
import 'package:youtrip/Action_Buttons/sub_Action_uttons/sub_card.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  bool isCardLocked = false;

  @override
  Widget build(BuildContext context) {
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
          'บัตร',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/55.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    'ล็อกบัตร',
                    style: TextStyle(
                      color: isCardLocked
                          ? Colors.red
                          : Colors.grey,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                Switch(
                  value: !isCardLocked,
                  activeColor: Colors.white,
                  activeTrackColor: const Color.fromARGB(255, 135, 194, 158),
                  inactiveThumbColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      isCardLocked = !value;
                    });
                  },
                ),
                SizedBox(
                  width: 80,
                  child: Text(
                    'ปลดล็อก',
                    style: TextStyle(
                      color: isCardLocked
                          ? Colors.grey
                          : const Color.fromARGB(255, 40, 212, 153),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _FeatureRow(
                    text: 'ใช้จ่ายทั้ง Online และ ในร้านค้า',
                    isCardLocked: isCardLocked),
                _FeatureRow(text: 'แลกเงิน', isCardLocked: isCardLocked),
                _FeatureRow(
                    text: 'กด ATM ในต่างประเทศ', isCardLocked: isCardLocked),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Text(
                    'ออกบัตรใหม่',
                    style: TextStyle(
                      color: Color.fromARGB(255, 109, 55, 166),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'บัตรหาย หรือ ชำรุด สามารถออกบัตรใหม่เพียง ฿150.00 บาท',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SubCardScreen()), 
                      );
                    },
                    child: const Text(
                      'ออกบัตรใหม่',
                      style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline, 
                      ),
                    ),
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

class _FeatureRow extends StatelessWidget {
  final String text;
  final bool isCardLocked; // เพิ่มตัวแปรเพื่อควบคุมสถานะของการล็อก

  const _FeatureRow({required this.text, required this.isCardLocked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Icon(
            isCardLocked
                ? Icons.close
                : Icons.check, // เปลี่ยนไอคอนตามสถานะล็อก
            color: isCardLocked
                ? Colors.red // สีแดงเมื่อบัตรถูกล็อก
                : const Color.fromARGB(255, 40, 212, 153), // สีเขียวเมื่อบัตรถูกปลดล็อก
          ),
        ],
      ),
    );
  }
}
