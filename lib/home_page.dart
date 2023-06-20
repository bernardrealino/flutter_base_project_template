import 'package:flutter/material.dart';
import 'package:flutter_splashscreen/dashboard.dart';
import './setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  bool _isClicked = true;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[100],
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.greenAccent[100]),
        title: const Text("Homepage"),
      ),
      floatingActionButton: Visibility(
        visible: isVisible,
        child: FloatingActionButton(
            onPressed: () {
              setState(() {});
            },
            child: const Icon(
              Icons.add,
            )),
      ),
      body: Center(
          child: currentIndex == 0
              ? const DashboardPage()
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      _isClicked = !_isClicked;
                    });
                  },
                  child: _isClicked
                      ? Image.asset(
                          'assets/Astrology with Tarot cards and crystal ball.png')
                      : Image.network(
                          "https://imgv3.fotor.com/images/blog-cover-image/part-blurry-image.jpg"),
                )),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Dashboard",
            icon: Icon(
              Icons.dashboard,
            ),
          ),
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            currentIndex == 0 ? isVisible = true : isVisible = false;
          });
        },
      ),
    );
  }
}

addItem() {}
