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

Future<void> buildEventList(String mainEvent, String subEvent) async {
  // i want to add the mainEvent value to the app state variable eventList and return the new updated eventList as a list of strings
  // Check if eventList and subEventList are null and initialize if necessary
  FFAppState().update(() {
    FFAppState().eventList ??= [];
    FFAppState().subEventList ?? [];

    // Add the mainEvent to the eventList & subEvent to the subEventList
    FFAppState().eventList.add(mainEvent);
    FFAppState().subEventList.add(subEvent);
  });
}
