import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtrip/Menu/sub_Menu/menu_overlay.dart';
import 'package:youtrip/Menu/sub_Menu/special_card.dart';

class SpecialScreen extends StatefulWidget {
  const SpecialScreen({super.key});

  @override
  _SpecialScreenState createState() => _SpecialScreenState();
}

class _SpecialScreenState extends State<SpecialScreen> {
  bool _isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 55, 166),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView( // Makes the content scrollable
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Header section with menu toggle
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 51, 12, 94),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/youT.png',
                        width: 80,
                        height: 80,
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Color.fromARGB(255, 153, 255, 192),
                        ),
                        onPressed: _toggleMenu,
                      ),
                    ],
                  ),
                ),
                // Perks header section
                Container(
                  height: 100,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 109, 55, 166),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "perks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Color.fromARGB(255, 153, 255, 192),
                          ),
                        ],
                      ),
                      Text(
                        "ดีลพิเศษส่วนลดและเงินคืนจากพาร์ทเนอร์\nที่เราเลือกมาให้คุณ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                // SpecialCard grid section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(), // Prevents internal scrolling
                    children: List.generate(8, (index) {
                      String imagePath = '';
                      String discountText1 = '';
                      String discountText2 = '';

                      // Define images and text for cards
                      if (index == 0) {
                        imagePath = 'assets/images/agoda.png';
                        discountText1 = 'รับส่วนลด';
                        discountText2 = 'สูงสุด 7%';
                      } else if (index == 1) {
                        imagePath = 'assets/images/booking.png';
                        discountText1 = 'รับเงินคืน';
                        discountText2 = 'สูงสุด 15%';
                      } else if (index == 2) {
                        imagePath = 'assets/images/klook.png';
                        discountText1 = 'รับเงินคืน';
                        discountText2 = 'สูงสุด 5%';
                      } else if (index == 3) {
                        imagePath = 'assets/images/kkday.png';
                        discountText1 = 'รับเงินคืน';
                        discountText2 = 'สูงสุด 5%';
                      } else if (index == 4) {
                        imagePath = 'assets/images/agoda.png';
                        discountText1 = 'รับเงินคืน';
                        discountText2 = 'สูงสุด 7%';
                      } else if (index == 5) {
                        imagePath = 'assets/images/booking.png';
                        discountText1 = 'รับเงินคืน';
                        discountText2 = 'สูงสุด 15%';
                      } else if (index == 6) {
                        imagePath = 'assets/images/klook.png';
                        discountText1 = 'รับเงินคืน';
                        discountText2 = 'สูงสุด 5%';
                      } else if (index == 7) {
                        imagePath = 'assets/images/kkday.png';
                        discountText1 = 'รับเงินคืน';
                        discountText2 = 'สูงสุด 5%';
                      }

                      // Return SpecialCard
                      return SpecialCard(
                        imagePath: imagePath,
                        discountText1: discountText1,
                        discountText2: discountText2,
                      );
                    }),
                  ),
                ),
                // Footer section
                Container(
                  color: const Color.fromARGB(255, 109, 55, 166),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      const Text(
                        "ต้องการความช่วยเหลือ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "ติดต่อศูนย์บริการลูกค้า YouTrip Contact Center\nตลอด 24 ชม. ได้ที่ support.th@you.co",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.tiktok, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Menu overlay
          MenuOverlay(isVisible: _isMenuVisible),
        ],
      ),
    );
  }
}
