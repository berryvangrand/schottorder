import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'missioncontrol_model.dart';
export 'missioncontrol_model.dart';

class MissioncontrolWidget extends StatefulWidget {
  const MissioncontrolWidget({super.key});

  @override
  _MissioncontrolWidgetState createState() => _MissioncontrolWidgetState();
}

class _MissioncontrolWidgetState extends State<MissioncontrolWidget> {
  late MissioncontrolModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissioncontrolModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'missioncontrol'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MISSIONCONTROL_missioncontrol_ON_INIT_ST');
      _model.menuquery = await queryMenuRecordOnce(
        limit: 1,
      );
      if (valueOrDefault(currentUserDocument?.userRole, '') == 'admin') {
        context.goNamed('Dashboard');
      } else {
        if (functions.avaiabletime() == true) {
          if (valueOrDefault<bool>(
                  currentUserDocument?.onboardingDone, false) ==
              true) {
            context.goNamed(
              'Order_Main',
              queryParameters: {
                'frissmenuref': serializeParam(
                  _model.menuquery?.first.reference,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );
          } else {
            context.pushNamed('Onboarding');
          }
        } else {
          context.goNamed(
            'OutofTime',
            queryParameters: {
              'frissmenuref': serializeParam(
                _model.menuquery?.first.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
