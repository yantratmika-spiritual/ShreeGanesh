/*
 * --------------------------------------------------------------------------- *
 * File: darshan.dart                                                          *
 * Project: pages                                                              *
 * Created Date: 11 Mar 2023                                                   *
 * Author: Vikas K Solegaonkar (vikas.solegaonkar@thinkprosystems.com)         *
 * Copyright(c) ThinkPro Systems Pty Ltd, 2023                                 *
 *                                                                             *
 * Last Modified: Sat Mar 11 2023                                              *
 * Modified By: Vikas K Solegaonkar                                            *
 *                                                                             *
 * HISTORY:                                                                    *
 * --------------------------------------------------------------------------- *
 * Date         By     Comments                                                *
 * --------------------------------------------------------------------------- *
 */

import 'package:flutter/material.dart';

import '../common.dart';

class Darshan extends StatefulWidget {
  const Darshan({super.key});

  @override
  State<Darshan> createState() => _DarshanState();
}

class _DarshanState extends State<Darshan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Darshan'),
      ),
      bottomNavigationBar: CommonWidgets.getBottomNavigationBar(context, 1),
    );
  }
}
