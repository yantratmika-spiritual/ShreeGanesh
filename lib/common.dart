/*
 * --------------------------------------------------------------------------- *
 * File: constants.dart                                                        *
 * Project: lib                                                                *
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

class CommonWidgets {
  static const String ROUTINE = 'Routine';
  static const String DARSHAN = 'Darshan';
  static const String SCRIPTURES = 'Scriptures';
  static const String CHANTS = 'Chants';

  static const List<String> choices = <String>[
    ROUTINE,
    DARSHAN,
    SCRIPTURES,
    CHANTS,
  ];

  static BottomNavigationBar getBottomNavigationBar(
      BuildContext context, index) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.photo),
          label: 'Darshan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Scriptures',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.audiotrack),
          label: 'Chants',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.today),
          label: 'Routine',
        ),
      ],
      backgroundColor: Colors.amber[900],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      onTap: (int index) {
        switch (index) {
          case 0:
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.pushNamed(context, '/darshan');
            break;
          case 2:
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.pushNamed(context, '/scriptures');
            break;
          case 3:
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.pushNamed(context, '/chants');
            break;
          case 4:
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
            Navigator.pushNamed(context, '/routine');
            break;
        }
      },
    );
  }
}
