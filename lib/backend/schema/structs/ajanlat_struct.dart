// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AjanlatStruct extends FFFirebaseStruct {
  AjanlatStruct({
    String? ajanlatPic,
    String? ajanlatLink,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ajanlatPic = ajanlatPic,
        _ajanlatLink = ajanlatLink,
        super(firestoreUtilData);

  // "Ajanlat_Pic" field.
  String? _ajanlatPic;
  String get ajanlatPic => _ajanlatPic ?? '';
  set ajanlatPic(String? val) => _ajanlatPic = val;
  bool hasAjanlatPic() => _ajanlatPic != null;

  // "Ajanlat_link" field.
  String? _ajanlatLink;
  String get ajanlatLink => _ajanlatLink ?? '';
  set ajanlatLink(String? val) => _ajanlatLink = val;
  bool hasAjanlatLink() => _ajanlatLink != null;

  static AjanlatStruct fromMap(Map<String, dynamic> data) => AjanlatStruct(
        ajanlatPic: data['Ajanlat_Pic'] as String?,
        ajanlatLink: data['Ajanlat_link'] as String?,
      );

  static AjanlatStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AjanlatStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Ajanlat_Pic': _ajanlatPic,
        'Ajanlat_link': _ajanlatLink,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Ajanlat_Pic': serializeParam(
          _ajanlatPic,
          ParamType.String,
        ),
        'Ajanlat_link': serializeParam(
          _ajanlatLink,
          ParamType.String,
        ),
      }.withoutNulls;

  static AjanlatStruct fromSerializableMap(Map<String, dynamic> data) =>
      AjanlatStruct(
        ajanlatPic: deserializeParam(
          data['Ajanlat_Pic'],
          ParamType.String,
          false,
        ),
        ajanlatLink: deserializeParam(
          data['Ajanlat_link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AjanlatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AjanlatStruct &&
        ajanlatPic == other.ajanlatPic &&
        ajanlatLink == other.ajanlatLink;
  }

  @override
  int get hashCode => const ListEquality().hash([ajanlatPic, ajanlatLink]);
}

AjanlatStruct createAjanlatStruct({
  String? ajanlatPic,
  String? ajanlatLink,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AjanlatStruct(
      ajanlatPic: ajanlatPic,
      ajanlatLink: ajanlatLink,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AjanlatStruct? updateAjanlatStruct(
  AjanlatStruct? ajanlat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ajanlat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAjanlatStructData(
  Map<String, dynamic> firestoreData,
  AjanlatStruct? ajanlat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ajanlat == null) {
    return;
  }
  if (ajanlat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ajanlat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ajanlatData = getAjanlatFirestoreData(ajanlat, forFieldValue);
  final nestedData = ajanlatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ajanlat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAjanlatFirestoreData(
  AjanlatStruct? ajanlat, [
  bool forFieldValue = false,
]) {
  if (ajanlat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ajanlat.toMap());

  // Add any Firestore field values
  ajanlat.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAjanlatListFirestoreData(
  List<AjanlatStruct>? ajanlats,
) =>
    ajanlats?.map((e) => getAjanlatFirestoreData(e, true)).toList() ?? [];
