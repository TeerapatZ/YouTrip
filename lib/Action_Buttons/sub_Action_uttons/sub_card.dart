import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SubCardScreen extends StatefulWidget {
  const SubCardScreen({super.key});

  @override
  _SubCardScreenState createState() => _SubCardScreenState();
}

class _SubCardScreenState extends State<SubCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color.fromARGB(255, 109, 55, 166)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ออกบัตรใหม่',
              style: TextStyle(
                color: Color.fromARGB(255, 109, 55, 166),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '฿150.00',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ที่อยู่จัดส่ง',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '1518 ถนน ​ประชา​ราษฎร์ ​1 แขวงวงศ์สว่าง เขตบางซื่อ กรุงเทพมหานคร 10800',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'หมายเหตุ: บัตรปัจจุบันของคุณจะถูกระงับ หลังจากยืนยันการออกบัตรใหม่',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildSlideAction(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSlideAction() {
    return SlideAction(
      outerColor: const Color.fromARGB(255, 40, 212, 153),
      sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.white),
      text: 'เลื่อนเพื่อยืนยัน',
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      onSubmit: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Error404()),
        );
        return null;
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
