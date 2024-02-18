import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onImagePicked});
  final void Function(File image) onImagePicked;
  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _soureFile;

  void _takePhoto() async {
    final ImagePicker imagePicker = ImagePicker();
    // final takenImage = await imagePicker.pickImage(source: ImageSource.gallery);
    final takenImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (takenImage == null) {
      return;
    }
    setState(() {
      _soureFile = File(takenImage.path);
    });
    widget.onImagePicked(_soureFile!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePhoto,
      icon: const Icon(Icons.camera),
      label: const Text("Take Picture"),
    );

    if (_soureFile != null) {
      content = GestureDetector(
        onTap: _takePhoto,
        child: Image.file(
          _soureFile!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
        height: 250,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
        child: content);
  }
}
