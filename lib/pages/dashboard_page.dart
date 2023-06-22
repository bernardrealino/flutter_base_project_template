import 'package:flutter/material.dart';
import 'package:flutter_base_project_template/pages/cart_page.dart';
import 'package:flutter_base_project_template/pages/inbox_page.dart';
import 'package:flutter_base_project_template/pages/pageview_page/webview_page.dart';
import 'package:flutter_base_project_template/pages/profile_page.dart';
import 'package:flutter_base_project_template/pages/setting_page.dart';

import 'movie_page.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildCard('Profile', Icons.person, const ProfilePage()),
            _buildCard('Shopping Cart', Icons.shopping_cart, const CartPage()),
            _buildCard('Inbox', Icons.mail, InboxPage()),
            _buildCard('Setting', Icons.settings, const SettingPage()),
            _buildCard('Movie', Icons.movie, const MoviePage()),
            _buildCard('Web', Icons.web, const WebViewApp()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, page) {
    return Card(
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => page,
            ),
          );
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
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
