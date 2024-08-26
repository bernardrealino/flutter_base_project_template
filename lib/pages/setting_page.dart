import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _notificationEnabled = true;
  bool _darkModeEnabled = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notificationEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationEnabled = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_notificationEnabled) {}
              // Save settings or perform any other action
              // you want when the user taps the button
            },
            child: const Text('Test Notification'),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          ListTile(
            title: const Text('Slider Value'),
            subtitle: Slider(
              value: _sliderValue,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Save settings or perform any other action
              // you want when the user taps the button
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
