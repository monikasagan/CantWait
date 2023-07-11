import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
          AddEventTextField(
            controller: titleController,
            hintText: 'Title',
          ),
          const SizedBox(
            height: 20,
          ),
          AddEventTextField(
            controller: imageController,
            hintText: 'image URL',
          )
        ],
      ),
    );
  }
}

class AddEventTextField extends StatelessWidget {
  const AddEventTextField(
      {super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade800),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.grey.shade800,
          filled: true,
        ),
      ),
    );
  }
}
