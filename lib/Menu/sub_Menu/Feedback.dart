import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isButtonEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          children: [
            const Text(
              'ความเห็นของคุณมีค่าสำหรับเรา',
              style: TextStyle(
                color: Color.fromARGB(255, 109, 55, 166),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 50),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'ส่งข้อความหาเราได้ที่นี่',
                border: UnderlineInputBorder(),
                hintStyle: TextStyle(
                  height: 1, 
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {
                      // เพิ่มฟังก์ชันการส่งข้อความ
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isButtonEnabled
                    ? const Color.fromARGB(255, 109, 55, 166)
                    : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                'ส่ง',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
