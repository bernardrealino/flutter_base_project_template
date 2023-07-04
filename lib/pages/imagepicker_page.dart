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
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 25,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.download_rounded),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      pickedFile = picker
                          .getImage(source: ImageSource.camera)
                          .whenComplete(() => setState(() {}));
                    },
                    icon: const Icon(Icons.add)),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  onPressed: () async {
                    pickedFile = picker
                        .getImage(
                          source: ImageSource.gallery,
                        )
                        .whenComplete(() => setState(() {}));
                  },
                  icon: const Icon(Icons.photo_camera_back),
                ),
              ],
            ),
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
                  color: Colors.blue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
