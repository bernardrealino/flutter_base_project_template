import 'package:flutter/material.dart';
import 'package:flutter_splashscreen/pages/home_page.dart';
import 'package:flutter_splashscreen/pages/setting_page.dart';
import 'package:flutter_splashscreen/splashscreen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildCard('Profile', Icons.person, 0),
            _buildCard('Shopping Cart', Icons.shopping_cart, 1),
            _buildCard('Messages', Icons.mail, 2),
            _buildCard('Setting', Icons.settings, 3),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, int onTapValue) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          if (onTapValue == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const SettingPage(),
              ),
            );
          } else if (onTapValue == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const HomePage(),
              ),
            );
          } else if (onTapValue == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => SplashScreen(),
              ),
            );
          } else if (onTapValue == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const SettingPage(),
              ),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
