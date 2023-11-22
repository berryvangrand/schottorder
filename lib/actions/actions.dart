import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/fizetes_kesz/fizetes_kesz_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';

Future fizetes(
  BuildContext context, {
  required double? price,
  int? quantity,
  String? selectedmenu,
  String? megjegyzes,
  DocumentReference? actualmenu,
}) async {
  String? paymentId;
  bool? createdszamla;
  RendelesekRecord? createdrendeles;

  final paymentResponse = await processStripePayment(
    context,
    amount: (((price! * 1.05) * quantity!.toDouble()) * 100).round(),
    currency: 'HUF',
    customerEmail: currentUserEmail,
    customerName: currentUserDisplayName,
    description: '$selectedmenu Menü megrendelése',
    allowGooglePay: true,
    allowApplePay: false,
    buttonColor: FlutterFlowTheme.of(context).primary,
    buttonTextColor: FlutterFlowTheme.of(context).primaryBackground,
  );
  if (paymentResponse.paymentId == null &&
      paymentResponse.errorMessage != null) {
    showSnackbar(
      context,
      'Sajnáljuk, hiba lépett fel a fizetéskor! Próbálkozz újra!',
    );
  }
  paymentId = paymentResponse.paymentId ?? '';

  if (paymentId != '') {
    createdszamla = await actions.szamlacreationweb(
      functions.date(),
      currentUserEmail,
      currentUserDisplayName,
      valueOrDefault(currentUserDocument?.zip, 0).toString(),
      valueOrDefault(currentUserDocument?.telepules, ''),
      valueOrDefault(currentUserDocument?.address, ''),
      'Schott $selectedmenu menű megrendelése',
      quantity,
      price,
      price* quantity,
      (price* 1.05) * quantity,
      ((price* 5) / 100) * quantity,
    );
    if (createdszamla == true) {
      var rendelesekRecordReference = RendelesekRecord.collection.doc();
      await rendelesekRecordReference.set(createRendelesekRecordData(
        nev: currentUserDisplayName,
        telefonszam: currentPhoneNumber,
        menutipus: selectedmenu,
        darabszam: quantity,
        megjegyzes: megjegyzes,
        rendelesDatuma: getCurrentTimestamp,
        rendelo: currentUserReference,
        rendelesPrice: price,
        rendelesID: random_data.randomInteger(100000, 999999).toString(),
      ));
      createdrendeles = RendelesekRecord.getDocumentFromData(
          createRendelesekRecordData(
            nev: currentUserDisplayName,
            telefonszam: currentPhoneNumber,
            menutipus: selectedmenu,
            darabszam: quantity,
            megjegyzes: megjegyzes,
            rendelesDatuma: getCurrentTimestamp,
            rendelo: currentUserReference,
            rendelesPrice: price,
            rendelesID: random_data.randomInteger(100000, 999999).toString(),
          ),
          rendelesekRecordReference);
      await showAlignedDialog(
        barrierDismissible: false,
        context: context,
        isGlobal: true,
        avoidOverflow: false,
        targetAnchor:
            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        followerAnchor:
            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
        builder: (dialogContext) {
          return const Material(
            color: Colors.transparent,
            child: FizetesKeszWidget(),
          );
        },
      );

      context.goNamed(
        'Order_Main',
        queryParameters: {
          'frissmenuref': serializeParam(
            actualmenu,
            ParamType.DocumentReference,
          ),
        }.withoutNulls,
      );
    } else {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('Sajnos nem tudtuk elkészítnei a számládat!'),
            content: const Text('Kérlek próbálkozz újra később.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  } else {
    return;
  }
}
