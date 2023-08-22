import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool receivePushNotifications = true;
  bool receiveOfferByEmail = false;
  bool showFloatingButton = true;
  String selectedLanguage = 'English';

  List<String> availableLanguages = ['English', 'Spanish', 'French'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          buildContainer(
            'Language',
            DropdownButton(
              value: selectedLanguage,
              onChanged: (newValue) {
                setState(() {
                  selectedLanguage = newValue as String;
                });
              },
              items: availableLanguages.map<DropdownMenuItem<String>>(
                    (language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                },
              ).toList(),
            ),
          ),
          buildContainer(
            'Receive Push Notifications',
            Checkbox(
              value: receivePushNotifications,
              onChanged: (newValue) {
                setState(() {
                  receivePushNotifications = newValue!;
                });
              },
            ),
          ),
          buildContainer(
            'Receive Offer by Email',
            Checkbox(
              value: receiveOfferByEmail,
              onChanged: (newValue) {
                setState(() {
                  receiveOfferByEmail = newValue!;
                });
              },
            ),
          ),
          buildContainer(
            'Show Floating Button',
            Checkbox(
              value: showFloatingButton,
              onChanged: (newValue) {
                setState(() {
                  showFloatingButton = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
Widget buildContainer(String title, Widget content) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    ),
  );
}