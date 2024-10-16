import 'package:flutter/material.dart';
import 'package:youtrip/Menu/sub_Menu/Feedback.dart';
import 'package:youtrip/Pin/PIN.dart';
import 'package:youtrip/Menu/sub_Menu/language.dart';
import 'package:youtrip/screens/sub_screen/loading.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Variable to keep track of the Face ID switch state
  bool _isFaceIDEnabled = true;

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
          'ตั้งค่า',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SectionTitle(title: 'ด้านความปลอดภัย'),
          ListTile(
            title: const Text('เปลี่ยน App PIN'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PinInputScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('เปลี่ยน Card PIN'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('coming soon stay tuned'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(''),
                        const Text(''),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/000.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    actions: <Widget>[
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
          ),
          SwitchListTile(
            title: const Text('ใช้งาน Face ID'),
            value: _isFaceIDEnabled,
            activeColor: const Color.fromARGB(255, 255, 255, 255),
            activeTrackColor: const Color.fromARGB(255, 135, 194, 158),
            inactiveThumbColor: Colors.white,
            onChanged: (bool value) {
              setState(() {
                _isFaceIDEnabled = value;
              });
            },
          ),
          const Divider(),
          const SectionTitle(title: 'การตั้งค่าอื่นๆ'),
          ListTile(
            title: const Text('เปลี่ยนภาษา'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const languageScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('การแจ้งเตือน'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('coming soon stay tuned'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(''),
                        const Text(''),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/88.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    actions: <Widget>[
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
          ),
          const Divider(), 
          const SectionTitle(title: 'เกี่ยวกับเรา'),
          ListTile(
            title: const Text('ความเห็นของคุณมีค่าสำหรับเรา'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FeedbackScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('ข้อกำหนดและเงื่อนไข'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('coming soon stay tuned'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(''),
                        const Text(''),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/000.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    actions: <Widget>[
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
          ),
          ListTile(
            title: const Text(
              'ออกจากระบบ',
              style:
                  TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Loading()),
              );
            },
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('เวอร์ชั่น'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Teerapat Chuenklin'),
                        const Text('(6507012660184)'),
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/images/ITD.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    actions: <Widget>[
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
            child: Center(
              child: Text(
                'เวอร์ชั่น: I-BIT (6507012660184)',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey[500],
        ),
      ),
    );
  }
}
