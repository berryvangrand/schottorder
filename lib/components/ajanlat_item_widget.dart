import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'ajanlat_item_model.dart';
export 'ajanlat_item_model.dart';

class AjanlatItemWidget extends StatefulWidget {
  const AjanlatItemWidget({
    super.key,
    required this.itemurl,
    required this.itemimage,
    required this.ajanlatref,
  });

  final String? itemurl;
  final String? itemimage;
  final DocumentReference? ajanlatref;

  @override
  _AjanlatItemWidgetState createState() => _AjanlatItemWidgetState();
}

class _AjanlatItemWidgetState extends State<AjanlatItemWidget> {
  late AjanlatItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjanlatItemModel());

    _model.emailController ??= TextEditingController(text: widget.itemurl);
    _model.emailFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 300.0,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: Container(
                    width: 150.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          _model.uploadedFileUrl != ''
                              ? _model.uploadedFileUrl
                              : widget.itemimage!,
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                      border: Border.all(
                        color: const Color(0xFFEAEFF5),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('AJANLAT_ITEM_ÚJ_FELTÖLTÉS_BTN_ON_TAP');
                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                    context: context,
                    imageQuality: 100,
                    allowPhoto: true,
                    includeBlurHash: true,
                    backgroundColor: Colors.white,
                    textColor: FlutterFlowTheme.of(context).accent1,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      showUploadMessage(
                        context,
                        'Uploading file...',
                        showLoading: true,
                      );
                      selectedUploadedFiles = selectedMedia
                          .map((m) => FFUploadedFile(
                                name: m.storagePath.split('/').last,
                                bytes: m.bytes,
                                height: m.dimensions?.height,
                                width: m.dimensions?.width,
                                blurHash: m.blurHash,
                              ))
                          .toList();

                      downloadUrls = (await Future.wait(
                        selectedMedia.map(
                          (m) async => await uploadData(m.storagePath, m.bytes),
                        ),
                      ))
                          .where((u) => u != null)
                          .map((u) => u!)
                          .toList();
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                        _model.uploadedFileUrl = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Success!');
                    } else {
                      setState(() {});
                      showUploadMessage(context, 'Failed to upload data');
                      return;
                    }
                  }

                  setState(() {
                    _model.ajanlatpic = _model.uploadedFileUrl;
                  });

                  await widget.ajanlatref!.update(createAjanlatokRecordData(
                    ajanlatKep: _model.uploadedFileUrl,
                    blurhash: _model.uploadedLocalFile.blurHash,
                  ));
                },
                text: 'Új feltöltés',
                icon: const Icon(
                  Icons.upgrade,
                  color: Color(0xFFB3CDE8),
                  size: 18.0,
                ),
                options: FFButtonOptions(
                  width: 150.0,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                  color: const Color(0x00FFFFFF),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Gilroy',
                        color: const Color(0xFFB3CDE8),
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Color(0xFFE2ECF4),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            Container(
              width: 200.0,
            ),
            Expanded(
              child: Align(
                alignment: const AlignmentDirectional(0.00, 1.00),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: SizedBox(
                    width: 160.0,
                    child: TextFormField(
                      controller: _model.emailController,
                      focusNode: _model.emailFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.emailController',
                        const Duration(milliseconds: 2000),
                        () async {
                          logFirebaseEvent(
                              'AJANLAT_ITEM_Email_ON_TEXTFIELD_CHANGE');
                          setState(() {
                            _model.ajanlaturl = _model.emailController.text;
                          });

                          await widget.ajanlatref!
                              .update(createAjanlatokRecordData(
                            ajanlatURL: _model.emailController.text,
                          ));
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'URL',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintText: 'https://...',
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Gilroy',
                            fontSize: 10.0,
                            useGoogleFonts: false,
                          ),
                      validator:
                          _model.emailControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: const AlignmentDirectional(1.00, -1.00),
          child: FlutterFlowIconButton(
            borderColor: const Color(0x003279C6),
            borderRadius: 20.0,
            borderWidth: 0.0,
            buttonSize: 40.0,
            fillColor: const Color(0x00182A4E),
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFFFB9B9),
              size: 16.0,
            ),
            onPressed: () async {
              logFirebaseEvent('AJANLAT_ITEM_delete_outline_rounded_ICN_');
              await widget.ajanlatref!.delete();
            },
          ),
        ),
      ],
    );
  }
}
