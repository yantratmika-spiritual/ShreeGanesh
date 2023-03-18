/*
 * --------------------------------------------------------------------------- *
 * File: main.dart                                                             *
 * Project: lib                                                                *
 * Created Date: 11 Mar 2023                                                   *
 * Author: Vikas K Solegaonkar (vikas.solegaonkar@thinkprosystems.com)         *
 * Copyright(c) ThinkPro Systems Pty Ltd, 2023                                 *
 *                                                                             *
 * Last Modified: Wed Mar 15 2023                                              *
 * Modified By: Vikas K Solegaonkar                                            *
 *                                                                             *
 * HISTORY:                                                                    *
 * --------------------------------------------------------------------------- *
 * Date         By     Comments                                                *
 * --------------------------------------------------------------------------- *
 */

import 'package:flutter/material.dart';
import 'package:shreeganesh/audioManager.dart';
import 'package:shreeganesh/common.dart';
import 'package:shreeganesh/pages/chants.dart';
import 'package:shreeganesh/pages/darshan.dart';
import 'package:shreeganesh/pages/readscripture.dart';
import 'package:shreeganesh/pages/scriptures.dart';
import 'package:shreeganesh/pages/routine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shree Ganesha',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.orange[900]!,
          onSurface: Colors.deepOrange[900]!,
          onBackground: Colors.amber[900]!,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/chants": (context) => const Chants(),
        "/scriptures": (context) => const Scriptures(),
        "/darshan": (context) => const Darshan(),
        "/routine": (context) => const Routine(),
        "/readscripture": (context) => const ReadScripture(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AudioManager.init();
    AudioManager.playAsset("audio/mixkit-church-bell-loop-621.m4a", true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: const Center(
          child: Text("Home Page"),
        ),
      ),
      bottomNavigationBar: CommonWidgets.getBottomNavigationBar(context, 0),
    );
  }
}
