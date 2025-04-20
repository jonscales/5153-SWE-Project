import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'waiver_adult_widget.dart' show WaiverAdultWidget;
import 'package:flutter/material.dart';

class WaiverAdultModel extends FlutterFlowModel<WaiverAdultWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for CheckboxListTile widget.
  bool? checkboxListTileValue;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    listViewController?.dispose();
  }

  /// Action blocks.
  Future onSignedWaiver(BuildContext context) async {
    FFAppState().hasAgreedWaiver = true;
  }
}
