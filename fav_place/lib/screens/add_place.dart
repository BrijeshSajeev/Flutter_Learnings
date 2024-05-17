import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:fav_place/providers/place_provider.dart';
import 'package:fav_place/widget/image_input.dart';
import 'package:fav_place/widget/location_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  void _savePlace() {
    final title = _titleController.text;
    if (title.isEmpty || _selectedImage == null) {
      return;
    }

    ref.read(placeProvider.notifier).addPlace(title, _selectedImage!);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new place."),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              decoration: const InputDecoration(
                label: Text(
                  'Name',
                ),
              ),
              controller: _titleController,
            ),
            const SizedBox(
              height: 12,
            ),
            ImageInput(
              onImagePicked: (img) {
                _selectedImage = img;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const LocationInput(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: _savePlace,
              child: const Text("Add Place"),
            ),
          ],
        ),
      ),
    );
  }
}
