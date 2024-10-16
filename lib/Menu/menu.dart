import 'package:flutter/material.dart';
import 'package:youtrip/Menu/Help.dart';
import 'package:youtrip/Menu/Special.dart';
import 'package:youtrip/Menu/Transfer.dart';
import 'package:youtrip/Menu/Withdraw.dart';
import 'package:youtrip/Menu/settings.dart';

class MenuDrawer extends StatelessWidget {
  final Animation<Offset> menuAnimation;

  const MenuDrawer({super.key, required this.menuAnimation});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: menuAnimation,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 280,
          color: const Color.fromARGB(255, 109, 55, 166),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.help_outline, color: Colors.white54),
                title: const Text(
                  'ต้องการความช่วยเหลือ?',
                  style: TextStyle(color: Colors.white, fontSize: 14), 
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpScreen()), 
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_offer, color: Colors.white54),
                title: Row(
                  children: [
                    const Text(
                      'ดีลพิเศษ',
                      style: TextStyle(color: Colors.white, fontSize: 14), 
                    ),
                    const SizedBox(width: 5), 
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 135, 194, 158), 
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'ใหม่',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 10, 
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SpecialScreen()), 
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.local_atm, color: Colors.white54),
                title: const Text(
                  'ถอนเงินสดต่างประเทศ',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WithdrawScreen()), 
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.redo, color: Colors.white54),
                title: const Text(
                  'โอนเงินเข้าบัญชีธนาคาร',
                  style: TextStyle(color: Colors.white, fontSize: 14), 
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TransferScreen()), 
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white54),
                title: const Text(
                  'ตั้งค่า',
                  style: TextStyle(color: Colors.white, fontSize: 14), 
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()), 
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



