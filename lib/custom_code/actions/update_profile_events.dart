// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateProfileEvents() async {
  // Add your function code here!
  final events = FFAppState().eventList;
  final subEvents = FFAppState().subEventList;

  FFAppState().update(() {
    FFAppState().event1 = (events.length > 0)
        ? '${events[0]}\n${subEvents.length > 0 ? subEvents[0] : ''}'
        : '';
    FFAppState().event2 = (events.length > 1)
        ? '${events[1]}\n${subEvents.length > 1 ? subEvents[1] : ''}'
        : '';
    FFAppState().event3 = (events.length > 2)
        ? '${events[2]}\n${subEvents.length > 2 ? subEvents[2] : ''}'
        : '';
    FFAppState().event4 = (events.length > 3)
        ? '${events[3]}\n${subEvents.length > 3 ? subEvents[3] : ''}'
        : '';
  });
  // FFAppState().update(() {
  //   FFAppState().subEvent1 = (subEvents.length > 0) ? subEvents[0] : '';
  //   FFAppState().subEvent2 = (subEvents.length > 1) ? subEvents[1] : '';
  //   FFAppState().subEvent3 = (subEvents.length > 2) ? subEvents[2] : '';
  //   FFAppState().subEvent4 = (subEvents.length > 3) ? subEvents[3] : '';
  // });
}
