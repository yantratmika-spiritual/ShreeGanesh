/*
 * --------------------------------------------------------------------------- *
 * File: readscripture.dart                                                    *
 * Project: pages                                                              *
 * Created Date: 13 Mar 2023                                                   *
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

import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'package:shreeganesh/common.dart';
import 'package:shreeganesh/pages/scriptures.dart';

class ReadScripture extends StatefulWidget {
  const ReadScripture({super.key});

  @override
  State<ReadScripture> createState() => _ReadScriptureState();
}

class _ReadScriptureState extends State<ReadScripture> {
  String contents = '';
  int fontSize = 18;

  Future<void> loadAsset(id) async {
    contents = await rootBundle.loadString('assets/text/$id.txt');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScriptureInfo;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        backgroundColor: Colors.amber[900],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton.small(
            onPressed: () {
              setState(() {
                fontSize++;
              });
            },
            backgroundColor: Colors.amber[900],
            heroTag: null,
            child:
                const Icon(Icons.text_increase, color: Colors.white, size: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.small(
            onPressed: () {
              setState(() {
                fontSize--;
              });
            },
            backgroundColor: Colors.amber[900],
            heroTag: null,
            child:
                const Icon(Icons.text_decrease, color: Colors.white, size: 15),
          ),
        ],
      ),
      body: FutureBuilder(
        future: loadAsset(args.file),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  contents,
                  style: TextStyle(
                    fontFamily: "Martel",
                    fontWeight: FontWeight.w300,
                    fontSize: fontSize.toDouble(),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: CommonWidgets.getBottomNavigationBar(context, 2),
    );
  }
}
