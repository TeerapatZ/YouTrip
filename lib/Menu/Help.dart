import 'package:flutter/material.dart';
import 'package:youtrip/Menu/settings.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  // List of FAQ items
  final List<Map<String, dynamic>> _faqItems = [
    {'title': 'สมัครใช้งาน YouTrip ต้องทำอย่างไร?', 'icon': Icons.chevron_right},
    {'title': 'YouTrip คืออะไร และใช้ทำไรได้บ้าง?', 'icon': Icons.chevron_right},
    {'title': 'ข้อดีของการใช้ YouTrip คืออะไร?', 'icon': Icons.chevron_right},
    {'title': 'เปิดใช้งานบัตร YouTrip อย่างไร?', 'icon': Icons.chevron_right},
    {'title': 'การแลกเปลี่ยนสกุนเงินของ YouTrip ทำงานอย่างไร?', 'icon': Icons.chevron_right},
    {'title': 'สกุนเงินอะไรบ้างที่ YouTrip รองรับสำหรับการใช้จ่าย?', 'icon': Icons.chevron_right},
    {'title': 'เกี่ยวกับ YouTrip', 'icon': Icons.info_outline},
    {'title': 'วิธีการลงทะเบียนและเปิดใช้งาน', 'icon': Icons.app_registration},
    {'title': 'การจัดการบัญชี YouTrip', 'icon': Icons.account_balance_wallet_outlined},
    {'title': 'การแลกเปลี่ยนสกุลเงินด้วย YouTrip', 'icon': Icons.swap_horiz},
    {'title': 'การใช้จ่ายด้วย YouTrip', 'icon': Icons.payment_outlined},
    {'title': 'การกดเงินสดที่ตู้ ATM', 'icon': Icons.money_outlined},
    {'title': 'ค่าธรรมเนียม', 'icon': Icons.atm_outlined},
    {'title': 'ความปลอดภัย', 'icon': Icons.security_outlined},
    {'title': 'ต้องการความช่วยเหลือเพิ่มเติม', 'icon': Icons.help_outline},
    {'title': 'ส่งข้อความหาเรา', 'icon': Icons.chat_bubble_outline},
    {'title': 'ติดต่อเราได้ที่ +66 20263812', 'icon': Icons.phone_outlined},
  ];

  // This will hold the filtered list of items based on the search query
  List<Map<String, dynamic>> _filteredFaqItems = [];
  String _searchQuery = ''; // Store the search query

  @override
  void initState() {
    super.initState();
    // Initially, show all items
    _filteredFaqItems = _faqItems;
  }

  // This method will be called whenever the search query changes
  void _filterItems(String query) {
    setState(() {
      _searchQuery = query; // Update the search query
      if (query.isEmpty) {
        _filteredFaqItems = _faqItems;
      } else {
        _filteredFaqItems = _faqItems
            .where((item) => item['title'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

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
          'FAQ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search bar at the top
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search FAQ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                _filterItems(value);
              },
            ),
          ),
          Expanded(
            child: _filteredFaqItems.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.only(left: 10),
                    itemCount: _filteredFaqItems.length +
                        (_searchQuery.isEmpty ? 2 : 0), // Adjust for the section titles only if not searching
                    itemBuilder: (context, index) {
                      // Insert the first SectionTitle at the start if not searching
                      if (index == 0 && _searchQuery.isEmpty) {
                        return const SectionTitle(title: 'คำถามที่พบบ่อย');
                      }

                      // Check if "เกี่ยวกับ YouTrip" exists and insert a SectionTitle above it, only if not searching
                      int aboutYouTripIndex = _filteredFaqItems.indexWhere(
                          (faq) => faq['title'] == 'เกี่ยวกับ YouTrip');
                      if (aboutYouTripIndex != -1 &&
                          index == aboutYouTripIndex + 1 &&
                          _searchQuery.isEmpty) {
                        return const SectionTitle(title: 'คำถามที่พบบ่อย');
                      }

                      // Check if "ส่งข้อความหาเรา" exists and insert SectionTitle above it, only if not searching
                      int sendMessageIndex = _filteredFaqItems.indexWhere(
                          (faq) => faq['title'] == 'ส่งข้อความหาเรา');
                      if (sendMessageIndex != -1 &&
                          index == sendMessageIndex + 2 &&
                          _searchQuery.isEmpty) {
                        return const SectionTitle(title: 'ต้องการความช่วยเหลือเพิ่มเติม');
                      }

                      // Safely adjust the index for ListTile after section titles
                      var adjustedIndex = index - 1;
                      if (aboutYouTripIndex != -1 && index > aboutYouTripIndex + 1) {
                        adjustedIndex -= 1;
                      }
                      if (sendMessageIndex != -1 && index > sendMessageIndex + 2) {
                        adjustedIndex -= 1;
                      }

                      // Safely get the FAQ item from the adjusted index
                      if (adjustedIndex < 0 || adjustedIndex >= _filteredFaqItems.length) {
                        return const SizedBox(); // Return empty if index is out of bounds
                      }

                      final faq = _filteredFaqItems[adjustedIndex];

                      return ListTile(
                        title: Text(faq['title'] as String),
                        trailing: faq['icon'] == Icons.chevron_right
                            ? Icon(faq['icon'] as IconData) // Chevron icon aligned to the right
                            : null,
                        leading: faq['icon'] != Icons.chevron_right
                            ? Icon(faq['icon'] as IconData) // Regular icons on the left
                            : null,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(faq['title'] as String),
                                content: const Text('coming soon stay tuned'),
                                actions: [
                                  TextButton(
                                    child: const Text('ปิด'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

