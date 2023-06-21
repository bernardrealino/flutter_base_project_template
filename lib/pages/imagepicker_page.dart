import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _pickedImage;

  Future<bool> requestGalleryPermission() async {
    final PermissionStatus status = await Permission.photos.request();
    return status.isGranted;
  }

  Future<bool> requestCameraPermission() async {
    final PermissionStatus status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_pickedImage != null)
              Image.file(
                _pickedImage!,
                height: 200,
              ),
            ElevatedButton(
              onPressed: () async {
                bool hasGalleryPermission = await requestGalleryPermission();
                if (hasGalleryPermission) {
                  pickImage(ImageSource.gallery);
                } else {
                  // Handle permission denied
                }
              },
              child: Column(
                children: [
                  Icon(Icons.image),
                  Text('Open Gallery'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                bool hasCameraPermission = await requestCameraPermission();
                if (hasCameraPermission) {
                  pickImage(ImageSource.camera);
                } else {
                  // Handle permission denied
                }
              },
              child: Column(
                children: [
                  Icon(Icons.camera),
                  Text('Open Camera'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
