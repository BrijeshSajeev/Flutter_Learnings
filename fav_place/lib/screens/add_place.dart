import 'package:fav_place/providers/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  void _savePlace() {
    final title = _titleController.text;
    if (title.isEmpty) {
      return;
    }

    ref.read(placeProvider.notifier).addPlace(title);
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
