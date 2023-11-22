import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer_admin/drawer_admin_widget.dart';
import 'newmenu_widget.dart' show NewmenuWidget;
import 'package:flutter/material.dart';

class NewmenuModel extends FlutterFlowModel<NewmenuWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
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
    emailFocusNode?.dispose();
    emailController?.dispose();

    drawerAdminModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
