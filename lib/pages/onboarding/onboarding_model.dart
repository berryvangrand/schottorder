import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Nev widget.
  FocusNode? nevFocusNode;
  TextEditingController? nevController;
  String? Function(BuildContext, String?)? nevControllerValidator;
  String? _nevControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Tel widget.
  FocusNode? telFocusNode;
  TextEditingController? telController;
  String? Function(BuildContext, String?)? telControllerValidator;
  String? _telControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Lakcim widget.
  FocusNode? lakcimFocusNode1;
  TextEditingController? lakcimController1;
  String? Function(BuildContext, String?)? lakcimController1Validator;
  String? _lakcimController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Irszam widget.
  FocusNode? irszamFocusNode;
  TextEditingController? irszamController;
  String? Function(BuildContext, String?)? irszamControllerValidator;
  String? _irszamControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Telepules widget.
  FocusNode? telepulesFocusNode;
  TextEditingController? telepulesController;
  String? Function(BuildContext, String?)? telepulesControllerValidator;
  String? _telepulesControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Lakcim widget.
  FocusNode? lakcimFocusNode2;
  TextEditingController? lakcimController2;
  String? Function(BuildContext, String?)? lakcimController2Validator;
  String? _lakcimController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MenuRecord>? menulekeres;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nevControllerValidator = _nevControllerValidator;
    telControllerValidator = _telControllerValidator;
    lakcimController1Validator = _lakcimController1Validator;
    irszamControllerValidator = _irszamControllerValidator;
    telepulesControllerValidator = _telepulesControllerValidator;
    lakcimController2Validator = _lakcimController2Validator;
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
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
