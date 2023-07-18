import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/features/pages/main/add/add_page.dart';
import 'package:gansa/features/pages/main/home_page/cubit/home_cubit.dart';
import 'package:gansa/models/item_model.dart';
import 'package:gansa/repositories/items_repository.dart';
import 'package:gansa/repositories/sign_out_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(ItemsRepository(), SignOutRepository())..start(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          final itemModels = state.items;
          if (state.status == Status.loading) {
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                  backgroundColor: Color.fromARGB(255, 43, 54, 114),
                ),
              ),
            );
          }
          if (state.status == Status.initial) {
            const Scaffold(
              body: Center(
                child: Text('Initialization..'),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20,
                    sigmaY: 50,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              // centerTitle: true,
              title: const Text('Can\'t wait '),
              actions: [
                InkWell(
                  onTap: () async {
                    context.read<HomeCubit>().signOut();
                  },
                  child: const Icon(Icons.logout_outlined),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.grey,
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AddPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
            body: Center(
              child: ListView(
                children: [
                  for (final itemModel in itemModels) ...[
                    Dismissible(
                      key: ValueKey(itemModel.id),
                      background: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.indigo),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 32.0),
                            child: Icon(Icons.delete),
                          ),
                        ),
                      ),
                      confirmDismiss: (direction) async {
                        return direction == DismissDirection.endToStart;
                      },
                      onDismissed: (_) {
                        context
                            .read<HomeCubit>()
                            .delete(documentID: itemModel.id);
                      },
                      child: _EventTile(
                        itemModel: itemModel,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EventTile extends StatelessWidget {
  const _EventTile({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black12,
        ),
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.black12,
                image: DecorationImage(
                  image: NetworkImage(itemModel.imageURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          itemModel.title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          itemModel.releaseDateFormatted(),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          itemModel.daysLeft(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'days left',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
