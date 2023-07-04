import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final picker = ImagePicker();
  late Future<PickedFile?> pickedFile = Future.value(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image'),
      ),
      // backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    pickedFile = picker
                        .getImage(source: ImageSource.camera)
                        .whenComplete(() => setState(() {}));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 10),
                      Text("Add From Camera"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    pickedFile = picker
                        .getImage(
                          source: ImageSource.gallery,
                        )
                        .whenComplete(() => setState(() {}));
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.photo_camera_back),
                      SizedBox(width: 10),
                      Text("Open from Gallery"),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            FutureBuilder<PickedFile?>(
              future: pickedFile,
              builder: (context, snap) {
                if (snap.hasData) {
                  return Container(
                    color: Colors.blue,
                    child: Image.file(
                      File(snap.data!.path),
                      fit: BoxFit.contain,
                    ),
                  );
                }
                return Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Colors.grey,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                      ),
                      Text("Select Image to Show"),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                //Convert Image Logic Here
              },
              child: const Text("Press to Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
