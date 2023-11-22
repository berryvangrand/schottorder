import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'missioncontrol_widget.dart' show MissioncontrolWidget;
import 'package:flutter/material.dart';

class MissioncontrolModel extends FlutterFlowModel<MissioncontrolWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in missioncontrol widget.
  List<MenuRecord>? menuquery;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
