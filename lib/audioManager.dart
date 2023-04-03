/*
 * --------------------------------------------------------------------------- *
 * File: audioManager.dart                                                     *
 * Project: lib                                                                *
 * Created Date: 11 Mar 2023                                                   *
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

import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static late AudioPlayer player;
  static bool initialized = false;

  static void init() {
    if (!initialized) {
      player = AudioPlayer();
      initialized = true;
    }
  }

  static void playAsset(String asset, bool loop) {
    player.play(AssetSource(asset), mode: PlayerMode.lowLatency);
    if (loop) {
      player.setReleaseMode(ReleaseMode.loop);
    } else {
      player.setReleaseMode(ReleaseMode.stop);
    }
  }

  static void playUrl(String url, bool loop) {
    player.play(UrlSource(url));
    if (loop) {
      player.setReleaseMode(ReleaseMode.loop);
    } else {
      player.setReleaseMode(ReleaseMode.stop);
    }
  }

  void pause() {
    player.pause();
  }

  void resume() {
    player.resume();
  }

  void stop() {
    player.stop();
  }

  static void playBell() {
    playAsset("audio/bell05.mp3", false);
  }
}
