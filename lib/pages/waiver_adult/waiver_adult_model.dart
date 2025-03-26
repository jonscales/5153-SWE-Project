import '/flutter_flow/flutter_flow_util.dart';
import 'waiver_adult_widget.dart' show WaiverAdultWidget;
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class WaiverAdultModel extends FlutterFlowModel<WaiverAdultWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signature widget.
  SignatureController? signatureController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    signatureController?.dispose();
  }
}
