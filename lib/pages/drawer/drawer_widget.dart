import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'drawer_model.dart';
export 'drawer_model.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late DrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(1.00, 0.00),
            child: FlutterFlowIconButton(
              borderColor: const Color(0x00015ABB),
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 40.0,
              fillColor: const Color(0x00182A4E),
              hoverColor: const Color(0xFFF0F0F0),
              icon: const Icon(
                Icons.close_rounded,
                color: Color(0xB3888888),
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('DRAWER_COMP_Close_ON_TAP');
                if (Scaffold.of(context).isDrawerOpen ||
                    Scaffold.of(context).isEndDrawerOpen) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('DRAWER_COMP_Column_rlaqpexb_ON_TAP');
                      _model.frissmenu = await queryMenuRecordOnce(
                        queryBuilder: (menuRecord) => menuRecord.where(
                          'MenuNev',
                          isEqualTo: 'Default Menu',
                        ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      if (functions.avaiabletime() == true) {
                        context.pushNamed(
                          'Order_Main',
                          queryParameters: {
                            'frissmenuref': serializeParam(
                              _model.frissmenu?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        context.pushNamed(
                          'OutofTime',
                          queryParameters: {
                            'frissmenuref': serializeParam(
                              _model.frissmenu?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      }

                      setState(() {});
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 40.0, 0.0),
                                  child: Icon(
                                    Icons.add_chart,
                                    color:
                                        FlutterFlowTheme.of(context).aAAAAAclor,
                                    size: 16.0,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'Rendelés leadása',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gilroy',
                                          color: FlutterFlowTheme.of(context)
                                              .aAAAAAclor,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: Color(0xFFE2ECF4),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('DRAWER_COMP_Rendelesek_ON_TAP');

                    context.pushNamed('Rendeleseim');
                  },
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 40.0, 0.0),
                                  child: Icon(
                                    Icons.sticky_note_2_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).aAAAAAclor,
                                    size: 16.0,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'Rendeléseim',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gilroy',
                                          color: FlutterFlowTheme.of(context)
                                              .aAAAAAclor,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: Color(0xFFE2ECF4),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('DRAWER_COMP_Rendelesek_ON_TAP');

                    context.pushNamed('Profilom');
                  },
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                      color: Color(0x00FFFFFF),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 40.0, 0.0),
                                  child: Icon(
                                    Icons.person_outline,
                                    color:
                                        FlutterFlowTheme.of(context).aAAAAAclor,
                                    size: 16.0,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.00, 0.00),
                                  child: Text(
                                    'Profilom',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Gilroy',
                                          color: FlutterFlowTheme.of(context)
                                              .aAAAAAclor,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: Color(0xFFE2ECF4),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                    color: Color(0x00FFFFFF),
                  ),
                ),
              ],
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('DRAWER_COMP_KIJELENTKEZÉS_BTN_ON_TAP');
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();

              context.goNamedAuth('Login', context.mounted);
            },
            text: 'Kijelentkezés',
            icon: const Icon(
              Icons.logout_rounded,
              size: 18.0,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 40.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
              color: Colors.white,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Gilroy',
                    color: const Color(0xB3888888),
                    useGoogleFonts: false,
                  ),
              elevation: 20.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ],
      ),
    );
  }
}
