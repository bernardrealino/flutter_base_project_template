import 'package:flutter/material.dart';
import 'package:flutter_splashscreen/dashboard_page.dart';
// import './setting_page.dart';
import 'imagepicker_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool isVisible = true;
  String appBarTitle = "Dashboard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      floatingActionButton: Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
      body: Center(
        child: currentIndex == 0 ? const DashboardPage() : ImagePickerPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Dashboard",
            icon: Icon(
              Icons.dashboard,
            ),
          ),
          BottomNavigationBarItem(
            label: "Image",
            icon: Icon(
              Icons.image,
            ),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            if (currentIndex == 0) {
              isVisible = true;
              appBarTitle = "Dashboard";
            } else {
              isVisible = false;
              appBarTitle = "Image";
            }
          });
        },
      ),
    );
  }
}

addItem() {}
