/*
 * --------------------------------------------------------------------------- *
 * File: chants.dart                                                           *
 * Project: pages                                                              *
 * Created Date: 11 Mar 2023                                                   *
 * Author: Vikas K Solegaonkar (vikas.solegaonkar@thinkprosystems.com)         *
 * Copyright(c) ThinkPro Systems Pty Ltd, 2023                                 *
 *                                                                             *
 * Last Modified: Sun Mar 12 2023                                              *
 * Modified By: Vikas K Solegaonkar                                            *
 *                                                                             *
 * HISTORY:                                                                    *
 * --------------------------------------------------------------------------- *
 * Date         By     Comments                                                *
 * --------------------------------------------------------------------------- *
 */

import 'package:flutter/material.dart';
import 'package:shreeganesh/common.dart';

import '../audioManager.dart';

class Chants extends StatefulWidget {
  const Chants({super.key});

  @override
  State<Chants> createState() => _ChantsState();
}

class _ChantsState extends State<Chants> {
  @override
  void initState() {
    super.initState();
    AudioManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.amber[900]!,
              ),
            ),
            onPressed: () {
              AudioManager.playAsset("audio/ganeshamantra.mp4", true);
            },
            child: const Text("Mantra"),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.amber[900]!,
              ),
            ),
            onPressed: () {
              AudioManager.playAsset("audio/ganeshaaarti.mp4", true);
            },
            child: const Text("Atharvashirsha"),
          ),
        ],
      )),
      bottomNavigationBar: CommonWidgets.getBottomNavigationBar(context, 3),
    );
  }
}
