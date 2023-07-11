import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gansa/components/my_text_field.dart';

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
  const AddPage({super.key});
}

class _AddPageState extends State<AddPage> {
  final titleController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new upcoming title'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('events').add({
                'title': titleController.text,
                'image_URL': imageController.text,
              });
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        children: [
          MyTextField(
            obscureText: false,
            controller: titleController,
            hintText: 'Title',
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            obscureText: false,
            controller: imageController,
            hintText: 'image URL',
          )
        ],
      ),
    );
  }
}
