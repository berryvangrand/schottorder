// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TargetDateStruct extends FFFirebaseStruct {
  TargetDateStruct({
    DateTime? targetDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _targetDate = targetDate,
        super(firestoreUtilData);

  // "TargetDate" field.
  DateTime? _targetDate;
  DateTime? get targetDate => _targetDate;
  set targetDate(DateTime? val) => _targetDate = val;
  bool hasTargetDate() => _targetDate != null;

  static TargetDateStruct fromMap(Map<String, dynamic> data) =>
      TargetDateStruct(
        targetDate: data['TargetDate'] as DateTime?,
      );

  static TargetDateStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TargetDateStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'TargetDate': _targetDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'TargetDate': serializeParam(
          _targetDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TargetDateStruct fromSerializableMap(Map<String, dynamic> data) =>
      TargetDateStruct(
        targetDate: deserializeParam(
          data['TargetDate'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TargetDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TargetDateStruct && targetDate == other.targetDate;
  }

  @override
  int get hashCode => const ListEquality().hash([targetDate]);
}

TargetDateStruct createTargetDateStruct({
  DateTime? targetDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TargetDateStruct(
      targetDate: targetDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TargetDateStruct? updateTargetDateStruct(
  TargetDateStruct? targetDateStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    targetDateStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTargetDateStructData(
  Map<String, dynamic> firestoreData,
  TargetDateStruct? targetDateStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (targetDateStruct == null) {
    return;
  }
  if (targetDateStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && targetDateStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final targetDateStructData =
      getTargetDateFirestoreData(targetDateStruct, forFieldValue);
  final nestedData =
      targetDateStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = targetDateStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTargetDateFirestoreData(
  TargetDateStruct? targetDateStruct, [
  bool forFieldValue = false,
]) {
  if (targetDateStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(targetDateStruct.toMap());

  // Add any Firestore field values
  targetDateStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTargetDateListFirestoreData(
  List<TargetDateStruct>? targetDateStructs,
) =>
    targetDateStructs
        ?.map((e) => getTargetDateFirestoreData(e, true))
        .toList() ??
    [];
