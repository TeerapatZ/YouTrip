import 'package:flutter/material.dart';

class MenuOverlay extends StatelessWidget {
  final bool isVisible;

  const MenuOverlay({super.key, required this.isVisible});
@override
  Widget build(BuildContext context) {
    // Get screen height using MediaQuery
    final double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: isVisible ? 50 : -screenHeight, 
      left: 0,
      right: 0,
      child: Container(
        height: screenHeight * 0.3, 
        color: const Color.fromARGB(255, 51, 12, 94),
        child: Column(
          children: [
            ListTile(
              title: const Text(
                'เกี่ยวกับเรา',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('coming soon stay tuned'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
            ListTile(
              title: const Text(
                'Blog',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('coming soon stay tuned'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                'Perks',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('coming soon stay tuned'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
            ListTile(
              title: const Text(
                'ช่วยเหลือ',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('coming soon stay tuned'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                'TH',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('coming soon stay tuned'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
          ],
        ),
      ),
    );
  }
}

