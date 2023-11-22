import '/flutter_flow/flutter_flow_util.dart';
import 'ajanlat_item_widget.dart' show AjanlatItemWidget;
import 'package:flutter/material.dart';

class AjanlatItemModel extends FlutterFlowModel<AjanlatItemWidget> {
  ///  Local state fields for this component.

  String ajanlatpic = 'false';

  String ajanlaturl = 'NaN';

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
