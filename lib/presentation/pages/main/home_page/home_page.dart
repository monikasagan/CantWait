import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/components/event_tile.dart';
import 'package:gansa/presentation/pages/auth/auth_page/cubit/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
  });

  final User? user;

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        leading: const Icon(Icons.tsunami),
        title: const Text('GanSA'),
        actions: [
          InkWell(
            onTap: () async {
              await context.read<AuthCubit>().signOut();
            },
            child: Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            EventTile(),
            Center(
              child: Text('logged as ${user?.email}'),
            ),
          ],
        ),
      ),
    );
  }
}
