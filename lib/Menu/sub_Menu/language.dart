import 'package:flutter/material.dart';

class languageScreen extends StatefulWidget {
  const languageScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<languageScreen> {
  String selectedLanguage = 'ไทย';

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
          'ภาษา',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('English'),
            trailing: selectedLanguage == 'English'
                ? const Icon(Icons.check, color: Colors.green) 
                : null,
            onTap: () {
              setState(() {
                selectedLanguage = 'English'; 
              });
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('ไทย'),
            trailing: selectedLanguage == 'ไทย'
                ? const Icon(Icons.check, color: Colors.green) 
                : null,
            onTap: () {
              setState(() {
                selectedLanguage = 'ไทย'; 
              });
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
