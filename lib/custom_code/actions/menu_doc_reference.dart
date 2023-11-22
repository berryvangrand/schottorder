// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';

Future<DocumentReference> menuDocReference(
  String? stringOfPath,
  String? docID,
) async {
  final db = FirebaseFirestore.instance;
  var stDocID = '';
  stDocID = docID.toString();
  var stPath = '';
  stPath = stringOfPath.toString();

  var reference = db.collection(stPath).doc(stDocID);
  // var ref = reference.path;
  // var streference = reference.toString();
  return reference;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
