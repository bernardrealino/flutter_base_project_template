import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<dynamic> jsonData = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String jsonString = await rootBundle.loadString('assets/movies.json');
    final data = await json.decode(jsonString);
    setState(() {
      jsonData = data["movies"];
      print("number of items ${jsonData.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: jsonData.length,
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(jsonData[index]['index']),
            child: ListTile(
              leading: Text(jsonData[index]['index'].toString()),
              title: Text(jsonData[index]['title']),
              subtitle: Text(jsonData[index]['year'].toString()),
              // You can add more Text widgets for other properties
            ),
          );
        },
      ),
    );
  }
}
