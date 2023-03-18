/*
 * --------------------------------------------------------------------------- *
 * File: audioManager.dart                                                     *
 * Project: lib                                                                *
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
    // "audio/mixkit-church-bell-loop-621.m4a"
    player.play(AssetSource(asset), mode: PlayerMode.lowLatency);
    if (loop) {
      player.setReleaseMode(ReleaseMode.loop);
    } else {
      player.setReleaseMode(ReleaseMode.stop);
    }
  }

  static void playUrl(String url) {
    player.play(UrlSource(url));
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
}
