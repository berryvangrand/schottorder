import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer_admin/drawer_admin_widget.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  bool searchactive = false;

  bool forupdate = false;

  DateTime? filtertimestart;

  DateTime? filtertimeend;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Dashboard widget.
  MenuRecord? frissmen;
  // Stores action output result for [Backend Call - API (PDFgenrealas)] action in Button widget.
  ApiCallResponse? pdfapidone;
  // State field(s) for searchfield widget.
  FocusNode? searchfieldFocusNode;
  TextEditingController? searchfieldController;
  String? Function(BuildContext, String?)? searchfieldControllerValidator;
  List<RendelesekRecord> simpleSearchResults = [];
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Menu_button widget.
  bool menuButtonHovered = false;
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
    searchfieldFocusNode?.dispose();
    searchfieldController?.dispose();

    drawerAdminModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
