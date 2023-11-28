import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer/drawer_widget.dart';
import 'dart:async';
import 'rendeleseim_widget.dart' show RendeleseimWidget;
import 'package:flutter/material.dart';

class RendeleseimModel extends FlutterFlowModel<RendeleseimWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<List<RendelesekRecord>>? firestoreRequestCompleter;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for Drawer component.
  late DrawerModel drawerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
