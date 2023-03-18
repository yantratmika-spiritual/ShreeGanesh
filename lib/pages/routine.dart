/*
 * --------------------------------------------------------------------------- *
 * File: routine.dart                                                          *
 * Project: pages                                                              *
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shreeganesh/common.dart';
import 'package:shreeganesh/constants.dart';

class Routine extends StatefulWidget {
  const Routine({super.key});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  final TextEditingController _activityController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final List<RoutineActivity> _activities = [];

  String _activityType = allActivities.keys.first;
  String _subActivityType = allActivities[allActivities.keys.first]![0];

  Future<void> showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateSb) => AlertDialog(
            title: const Text('Plan Routine'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: _activityController,
                    decoration: const InputDecoration(
                      hintText: 'Activity',
                    ),
                  ),
                  DropdownButton(
                    items: allActivities.keys.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    value: _activityType,
                    onChanged: (value) {
                      print(value);
                      setStateSb(() {
                        _activityType = value.toString();
                        _subActivityType = allActivities[_activityType]![0];
                      });
                    },
                  ),
                  DropdownButton(
                    items: allActivities[_activityType]?.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    value: _subActivityType,
                    onChanged: (value) {
                      print(value);
                      setStateSb(() {
                        _subActivityType = value.toString();
                      });
                    },
                  ),
                  TextField(
                    controller: _timeController,
                    decoration: const InputDecoration(
                      hintText: 'Time',
                    ),
                    onTap: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.inputOnly,
                        builder: (context, child) => Theme(
                          data: ThemeData().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Colors.orange[900]!,
                              onSurface: Colors.deepOrange[900]!,
                              onBackground: Colors.amber[900]!,
                            ),
                          ),
                          child: child!,
                        ),
                      );
                      if (time != null) {
                        // ignore: use_build_context_synchronously
                        _timeController.text = time.format(context);
                      }
                    },
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Save'),
                onPressed: () {
                  setState(() {
                    _activities.add(
                      RoutineActivity(
                        _activityController.text,
                        _timeController.text,
                        _activityType,
                      ),
                    );
                    _activities.sort((a, b) => a.time.compareTo(b.time));
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.amber[900]!,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "A perfect day starts with a perfect routine. Define a routine for yourself and follow it religiously.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: _activities
                    .map(
                      (a) => ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amber[100]!,
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.black,
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                          shadowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black,
                          ),
                        ),
                        onPressed: null,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Text(a.time),
                              const SizedBox(width: 10),
                              Text(a.activity),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: Colors.amber[900],
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: CommonWidgets.getBottomNavigationBar(context, 4),
    );
  }
}

class RoutineActivity {
  final String activity;
  final String time;
  final String type;

  RoutineActivity(this.activity, this.time, this.type);

  @override
  String toString() {
    return 'RoutineActivity{activity: $activity, time: $time, type: $type}';
  }

  Map<String, dynamic> toMap() {
    return {
      'activity': activity,
      'time': time,
      'type': type,
    };
  }

  factory RoutineActivity.fromMap(Map<String, dynamic> map) {
    return RoutineActivity(
      map['activity'],
      map['time'],
      map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RoutineActivity.fromJson(String source) =>
      RoutineActivity.fromMap(json.decode(source));

  RoutineActivity copyWith({
    String? activity,
    String? time,
    String? type,
  }) {
    return RoutineActivity(
      activity ?? this.activity,
      time ?? this.time,
      type ?? this.type,
    );
  }
}
