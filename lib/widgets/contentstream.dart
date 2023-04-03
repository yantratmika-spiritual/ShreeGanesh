/*
 * --------------------------------------------------------------------------- *
 * File: contentfeed.dart                                                      *
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

import 'dart:async';

import '../cloud.dart';

class ContentStream {
  static List<CloudMessage> messages = [];

  static Future<void> init() async {
    Cloud.init();
    add(
      CloudMessage(
        "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/01/21/Pictures/plating-devotee-around-delhi-weighing-donated-gold_2f6fc288-3c2a-11ea-bfbd-f812f33ac46f.jpg",
        "audio/ganeshamantra.mp4",
        "audio/ganeshamantra.mp4",
        "Ganesh Mantra",
        "Ganesh Mantra",
        "Ganesh Mantra",
        DateTime.now().microsecondsSinceEpoch,
      ),
    );
  }

  static void add(CloudMessage content) {
    messages.add(content);
    messages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }
}
