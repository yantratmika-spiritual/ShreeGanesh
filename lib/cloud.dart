/*
 * --------------------------------------------------------------------------- *
 * File: cloud.dart                                                            *
 * Project: lib                                                                *
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

import 'package:shreeganesh/widgets/contentstream.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Cloud {
  static const String socketUrl = "wss://socket.yogaworld.krazyminds.com";
  static late WebSocketChannel channel;
  static bool isConnected = false;
  static List<dynamic> messages = [];

  static void init() {
    Timer.periodic(const Duration(minutes: 5), (timer) {
      if (isConnected) {
      } else {
        connect();
      }
    });
  }

  static Future<void> connect() async {
    if (!isConnected) {
      final wsUrl = Uri.parse(socketUrl);
      channel = WebSocketChannel.connect(wsUrl);
      channel.stream.listen((m) {
        ContentStream.add(CloudMessage.fromJson(m));
      }, onDone: () {
        print("Channel is done");
        isConnected = false;
        connect();
      }, onError: (error) {
        print("Channel error: $error");
        isConnected = false;
        connect();
      });
      print("Waiting for channel to be ready");
      await channel.ready;
      print("Channel is ready");
      isConnected = true;
    }
  }
}

class CloudMessage {
  String image;
  String audio;
  String mantra;
  String title;
  String description;
  String youTube;
  int timestamp;

  CloudMessage(
    this.image,
    this.audio,
    this.mantra,
    this.title,
    this.description,
    this.youTube,
    this.timestamp,
  );

  Map<String, dynamic> toJson() => {
        'image': image,
        'audio': audio,
        'mantra': mantra,
        'title': title,
        'description': description,
        'youTube': youTube,
        'timestamp': timestamp,
      };

  @override
  String toString() => toJson().toString();

  static CloudMessage fromJson(Map<String, dynamic> json) {
    return CloudMessage(
      json['image'],
      json['audio'],
      json['mantra'],
      json['title'],
      json['description'],
      json['youTube'],
      json['timestamp'],
    );
  }
}
