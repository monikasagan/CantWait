import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.person_2_outlined),
          ),
        ],
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const Icon(Icons.tsunami),
        title: const Text('GanSA'),
      ),
      body: Center(
        child: ListView(
          children: [
            Center(child: Text('logged as ${user?.email}')),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Container(
                decoration: const BoxDecoration(color: Colors.black12),
                child: Column(
                  children: [
                    Container(
                      height: 170,
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.volleyballworld.com/image/private/t_q-best/fivb-prd/trjkxs6crohhnif688ol.jpg"),
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
                            children: [
                              const Text(
                                '',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                DateTime.april.toString(),
                              ),
                            ],
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
