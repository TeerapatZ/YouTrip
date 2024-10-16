import 'package:flutter/material.dart';

class SpecialCard extends StatelessWidget {
  final String imagePath;
  final String discountText1;
  final String discountText2;

  const SpecialCard({
    super.key,
    required this.imagePath,
    required this.discountText1,
    required this.discountText2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Column(
        children: [
          // ครึ่งบนสีขาว
          Container(
            height: 90,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // ครึ่งล่างสีม่วง
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 109, 55, 166),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    discountText1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 1),
                  Text(
                    discountText2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 1),
                  FittedBox(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'รับสิทธิ์เลย',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
