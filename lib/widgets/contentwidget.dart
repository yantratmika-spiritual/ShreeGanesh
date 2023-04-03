/*
 * --------------------------------------------------------------------------- *
 * File: contentwidget.dart                                                    *
 * Project: widgets                                                            *
 * Created Date: 03 Apr 2023                                                   *
 * Author: Vikas K Solegaonkar (vikas.solegaonkar@thinkprosystems.com)         *
 * Copyright(c) ThinkPro Systems Pty Ltd, 2023                                 *
 *                                                                             *
 * Last Modified: Mon Apr 03 2023                                              *
 * Modified By: Vikas K Solegaonkar                                            *
 *                                                                             *
 * HISTORY:                                                                    *
 * --------------------------------------------------------------------------- *
 * Date         By     Comments                                                *
 * --------------------------------------------------------------------------- *
 */

import 'package:flutter/material.dart';
import 'package:shreeganesh/cloud.dart';
import 'package:shreeganesh/common.dart';

import '../audioManager.dart';

class ContentWidget extends StatelessWidget {
  final CloudMessage data;
  const ContentWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CommonWidgets.header(data.title),
        Image.network(data.image),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  child: Image.asset("assets/images/bell.png", width: 30),
                  onPressed: () => AudioManager.playBell()),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  child: Image.asset("assets/images/play.png", width: 30),
                  onPressed: () => AudioManager.playUrl(data.audio, false)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  child: Image.asset("assets/images/repeat.png", width: 30),
                  onPressed: () => AudioManager.playUrl(data.mantra, true)),
            ),
          ],
        ),
        CommonWidgets.bodyText(data.description),
      ],
    );
  }
}
