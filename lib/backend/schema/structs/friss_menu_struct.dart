// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FrissMenuStruct extends FFFirebaseStruct {
  FrissMenuStruct({
    String? menuPic,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _menuPic = menuPic,
        _price = price,
        super(firestoreUtilData);

  // "Menu_Pic" field.
  String? _menuPic;
  String get menuPic => _menuPic ?? '';
  set menuPic(String? val) => _menuPic = val;
  bool hasMenuPic() => _menuPic != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static FrissMenuStruct fromMap(Map<String, dynamic> data) => FrissMenuStruct(
        menuPic: data['Menu_Pic'] as String?,
        price: castToType<double>(data['Price']),
      );

  static FrissMenuStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FrissMenuStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Menu_Pic': _menuPic,
        'Price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Menu_Pic': serializeParam(
          _menuPic,
          ParamType.String,
        ),
        'Price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static FrissMenuStruct fromSerializableMap(Map<String, dynamic> data) =>
      FrissMenuStruct(
        menuPic: deserializeParam(
          data['Menu_Pic'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['Price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'FrissMenuStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FrissMenuStruct &&
        menuPic == other.menuPic &&
        price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([menuPic, price]);
}

FrissMenuStruct createFrissMenuStruct({
  String? menuPic,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FrissMenuStruct(
      menuPic: menuPic,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FrissMenuStruct? updateFrissMenuStruct(
  FrissMenuStruct? frissMenu, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    frissMenu
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFrissMenuStructData(
  Map<String, dynamic> firestoreData,
  FrissMenuStruct? frissMenu,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (frissMenu == null) {
    return;
  }
  if (frissMenu.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && frissMenu.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final frissMenuData = getFrissMenuFirestoreData(frissMenu, forFieldValue);
  final nestedData = frissMenuData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = frissMenu.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFrissMenuFirestoreData(
  FrissMenuStruct? frissMenu, [
  bool forFieldValue = false,
]) {
  if (frissMenu == null) {
    return {};
  }
  final firestoreData = mapToFirestore(frissMenu.toMap());

  // Add any Firestore field values
  frissMenu.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFrissMenuListFirestoreData(
  List<FrissMenuStruct>? frissMenus,
) =>
    frissMenus?.map((e) => getFrissMenuFirestoreData(e, true)).toList() ?? [];
