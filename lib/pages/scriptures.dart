/*
 * --------------------------------------------------------------------------- *
 * File: scriptures.dart                                                       *
 * Project: pages                                                              *
 * Created Date: 11 Mar 2023                                                   *
 * Author: Vikas K Solegaonkar (vikas.solegaonkar@thinkprosystems.com)         *
 * Copyright(c) ThinkPro Systems Pty Ltd, 2023                                 *
 *                                                                             *
 * Last Modified: Mon Mar 13 2023                                              *
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

class Scriptures extends StatefulWidget {
  const Scriptures({super.key});

  @override
  State<Scriptures> createState() => _ScripturesState();
}

class _ScripturesState extends State<Scriptures> {
  final List<ScriptureInfo> scriptures = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadAsset() async {
    String indexContents = await rootBundle.loadString('assets/text/index.txt');
    List<String> indexList = indexContents.split('\n');
    scriptures.clear();
    for (String indexEntry in indexList) {
      var ie = indexEntry.split("##");
      scriptures.add(ScriptureInfo(file: ie[0], title: ie[1]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: loadAsset(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amber[100]!,
                          ),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/readscripture',
                            arguments: scriptures[index],
                          );
                        },
                        child: Text(
                          scriptures[index].title,
                          style: const TextStyle(
                            fontFamily: "Martel",
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: scriptures.length);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: CommonWidgets.getBottomNavigationBar(context, 2),
    );
  }
}

class ScriptureInfo {
  final String file;
  final String title;

  const ScriptureInfo({required this.file, required this.title});
}
