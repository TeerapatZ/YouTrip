import 'package:flutter/material.dart';

class Currencyyyyyyy extends StatelessWidget {
  const Currencyyyyyyy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Color.fromARGB(255, 109, 55, 166)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0), 
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              const SizedBox(height: 16),
              const Text(
                'สกุลเงินต่างประเทศอื่นๆ',
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold, 
                  color: Color.fromARGB(255, 109, 55, 166)
                ),
              ),
              Image.asset(
                'assets/images/44.png', 
                width: 150, 
                height: 150,
              ),
              const SizedBox(height: 24), 
              
              const SizedBox(height: 16), 
              const Text(
                'ด้วยบัตร YouTrip คุณสามารถใช้จ่ายได้มากกว่า 150 สกุลเงินทั่วโลกด้วยเรทที่ดีที่สุด โดยไม่มีค่าธรรมเนียมเพิ่มเติม',
                textAlign: TextAlign.left, 
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  buildSectionTitle('สำหรับ 10 สกุลเงินนี้นั้น คุณสามารถ'),
                  buildBulletPoint('แลกเปลี่ยนสกุลเงินภายใน app ก่อนการเดินทาง'),
                  buildBulletPoint('ใช้จ่ายด้วยสกุลเงินที่แลกไว้แล้วด้วยบัตรโดยไม่มีค่าใช้จ่ายเพิ่มเติม'),
                  const SizedBox(height: 16),
                  buildSectionTitle('นอกเหนือไปจากสกุลเงินดังกล่าว คุณสามารถ'),
                  buildBulletPoint('ใช้จ่ายด้วยสกุลเงินที่แลกไว้แล้วด้วยบัตรโดยไม่มีค่าใช้จ่ายเพิ่มเติม'),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'คุณสามารถตรวจสอบอัตราแลกเปลี่ยนล่าสุดสำหรับ 10 สกุลเงินที่สามารถแลกล่วงหน้าได้ภายในแอป สำหรับสกุลเงินอื่นๆ นั้น คุณสามารถตรวจสอบอัตราแลกเปลี่ยนล่าสุดได้จาก ',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  // Add your navigation or logic here
                },
                child: const Text(
                  'อัตราแลกเปลี่ยนของ MasterCard',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 255, 170), 
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromARGB(255, 0, 255, 170), 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'โดยใส่ 0% ในช่องค่าธรรมเนียม Bank Fee',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0), 
      child: Text(
        text,
        textAlign: TextAlign.left, 
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0), 
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
