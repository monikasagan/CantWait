import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gansa/app/core/enums.dart';
import 'package:gansa/presentation/pages/auth/login/cubit/login_cubit.dart';
import 'package:gansa/presentation/pages/main/home_page/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..start(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.pink,
              ),
            );
          }
        },
        builder: (context, state) {
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
          if (state.status == Status.error) {
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          }
          if (state.status == Status.initial) {
            const Scaffold(
              body: Center(child: Text('Initialization..')),
            );
          }
          final user = state.user;
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
                    context.read<LoginCubit>().signOut();
                  },
                  child: const Icon(Icons.logout_outlined),
                )
              ],
            ),
            body: Center(
                child: ListView(
              children: [
                const EventTile(title: '', imageURL: ''),
                Center(child: Text('logged as: ${user?.email}'))
              ],
            )),
          );
        },
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
    required this.title,
    required this.imageURL,
  });

  final String title;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: const BoxDecoration(
                color: Colors.black12,
                image: DecorationImage(
                    image:
                        NetworkImage('https://satkurier.pl/uploads/108053.jpg'),
                    fit: BoxFit.cover),
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
                      children: const [
                        Text(
                          'title',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '22.11.2023',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Text(
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
