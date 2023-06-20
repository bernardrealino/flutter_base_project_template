import 'package:flutter/material.dart';
import 'package:flutter_splashscreen/setting_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String buttonName = "CLICK";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  // onPrimary: Colors.red,
                  // primary: Colors.amber,
                  ),
              onPressed: () {
                setState(() {
                  buttonName = "Clicked";
                });
              },
              child: Text(buttonName)),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SettingPage(),
                  ),
                );
              },
              child: Text("Move to Next Page")),
        ],
      ),
    );
  }
}
