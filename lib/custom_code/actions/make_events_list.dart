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

Future makeEventsList(String mainEvent, String subEvent) async {
  // Add your function code here!

  Future<void> makeEventsList(String mainEvent, String subEvent) async {
    if (FFAppState().event1 == null || FFAppState().event1.isEmpty) {
      FFAppState().update(() {
        FFAppState().event1 = mainEvent;
        FFAppState().subEvent1 = subEvent;
      });
    } else if (FFAppState().event2 == null || FFAppState().event2.isEmpty) {
      FFAppState().update(() {
        FFAppState().event2 = mainEvent;
        FFAppState().subEvent2 = subEvent;
      });
    } else if (FFAppState().event3 == null || FFAppState().event3.isEmpty) {
      FFAppState().update(() {
        FFAppState().event3 = mainEvent;
        FFAppState().subEvent3 = subEvent;
      });
    } else if (FFAppState().event4 == null || FFAppState().event4.isEmpty) {
      FFAppState().update(() {
        FFAppState().event4 = mainEvent;
        FFAppState().subEvent4 = subEvent;
      });
    }
  }
}
