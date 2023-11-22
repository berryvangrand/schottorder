import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer_admin/drawer_admin_widget.dart';
import 'ajanlatok_widget.dart' show AjanlatokWidget;
import 'package:flutter/material.dart';

class AjanlatokModel extends FlutterFlowModel<AjanlatokWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for DrawerAdmin component.
  late DrawerAdminModel drawerAdminModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    drawerAdminModel = createModel(context, () => DrawerAdminModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerAdminModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
