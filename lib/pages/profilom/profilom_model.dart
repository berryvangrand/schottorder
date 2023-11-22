import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer/drawer_widget.dart';
import 'profilom_widget.dart' show ProfilomWidget;
import 'package:flutter/material.dart';

class ProfilomModel extends FlutterFlowModel<ProfilomWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Nev widget.
  FocusNode? nevFocusNode;
  TextEditingController? nevController;
  String? Function(BuildContext, String?)? nevControllerValidator;
  // State field(s) for Tel widget.
  FocusNode? telFocusNode;
  TextEditingController? telController;
  String? Function(BuildContext, String?)? telControllerValidator;
  // State field(s) for Lakcim widget.
  FocusNode? lakcimFocusNode1;
  TextEditingController? lakcimController1;
  String? Function(BuildContext, String?)? lakcimController1Validator;
  // State field(s) for Irszam widget.
  FocusNode? irszamFocusNode;
  TextEditingController? irszamController;
  String? Function(BuildContext, String?)? irszamControllerValidator;
  // State field(s) for Telepules widget.
  FocusNode? telepulesFocusNode;
  TextEditingController? telepulesController;
  String? Function(BuildContext, String?)? telepulesControllerValidator;
  // State field(s) for Lakcim widget.
  FocusNode? lakcimFocusNode2;
  TextEditingController? lakcimController2;
  String? Function(BuildContext, String?)? lakcimController2Validator;
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
    nevFocusNode?.dispose();
    nevController?.dispose();

    telFocusNode?.dispose();
    telController?.dispose();

    lakcimFocusNode1?.dispose();
    lakcimController1?.dispose();

    irszamFocusNode?.dispose();
    irszamController?.dispose();

    telepulesFocusNode?.dispose();
    telepulesController?.dispose();

    lakcimFocusNode2?.dispose();
    lakcimController2?.dispose();

    drawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
