/*
 * --------------------------------------------------------------------------- *
 * File: main.dart                                                             *
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

import 'package:flutter/material.dart';
import 'package:shreeganesh/audioManager.dart';
import 'package:shreeganesh/common.dart';
import 'package:shreeganesh/pages/chants.dart';
import 'package:shreeganesh/pages/darshan.dart';
import 'package:shreeganesh/pages/readscripture.dart';
import 'package:shreeganesh/pages/scriptures.dart';
import 'package:shreeganesh/pages/routine.dart';
import 'package:shreeganesh/widgets/contentstream.dart';
import 'package:shreeganesh/widgets/contentwidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AudioManager.init();
  ContentStream.init();
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: widgetList(),
      ),
      bottomNavigationBar: CommonWidgets.getBottomNavigationBar(context, 0),
    );
  }

  ListView widgetList() {
    return ListView.builder(
      itemCount: ContentStream.messages.length,
      itemBuilder: (context, index) {
        return ContentWidget(
          data: ContentStream.messages[index],
        );
      },
    );
  }
}
