import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/components/my_text_field.dart';
import 'package:gansa/features/pages/main/add/cubit/add_cubit.dart';
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
    return BlocProvider(
      create: (context) => AddCubit(),
      child: BlocConsumer<AddCubit, AddState>(
        listener: (context, state) {
          if (state.saved == true) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add new upcoming title'),
              actions: [
                IconButton(
                  onPressed: () async {
                    await context
                        .read<AddCubit>()
                        .add(titleController.text, imageController.text);
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
        },
      ),
    );
  }
}
