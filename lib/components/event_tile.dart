import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  const EventTile({
    super.key,
  });

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
                      children: const [
                        Text(
                          'VNL season START',
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
                      children: const [
                        Text(
                          '47',
                          style: TextStyle(color: Colors.black, fontSize: 50),
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
