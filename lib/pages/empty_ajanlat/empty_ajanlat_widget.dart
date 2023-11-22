import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_ajanlat_model.dart';
export 'empty_ajanlat_model.dart';

class EmptyAjanlatWidget extends StatefulWidget {
  const EmptyAjanlatWidget({super.key});

  @override
  _EmptyAjanlatWidgetState createState() => _EmptyAjanlatWidgetState();
}

class _EmptyAjanlatWidgetState extends State<EmptyAjanlatWidget> {
  late EmptyAjanlatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyAjanlatModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
          child: Icon(
            Icons.report,
            color: Color(0xFFEAEFF5),
            size: 80.0,
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.00, 0.00),
          child: Text(
            'Nincs feltöltve ajánlat',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Gilroy',
                  color: const Color(0xFFEAEFF5),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
        ),
      ],
    );
  }
}
