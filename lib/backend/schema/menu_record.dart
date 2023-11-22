import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MenuRecord extends FirestoreRecord {
  MenuRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "MenuNev" field.
  String? _menuNev;
  String get menuNev => _menuNev ?? '';
  bool hasMenuNev() => _menuNev != null;

  // "Ar" field.
  double? _ar;
  double get ar => _ar ?? 0.0;
  bool hasAr() => _ar != null;

  // "Megjegyzes" field.
  String? _megjegyzes;
  String get megjegyzes => _megjegyzes ?? '';
  bool hasMegjegyzes() => _megjegyzes != null;

  // "Menu_Pic" field.
  String? _menuPic;
  String get menuPic => _menuPic ?? '';
  bool hasMenuPic() => _menuPic != null;

  // "Ajanlatok" field.
  List<AjanlatStruct>? _ajanlatok;
  List<AjanlatStruct> get ajanlatok => _ajanlatok ?? const [];
  bool hasAjanlatok() => _ajanlatok != null;

  // "Avaiable" field.
  bool? _avaiable;
  bool get avaiable => _avaiable ?? false;
  bool hasAvaiable() => _avaiable != null;

  // "Blurhash" field.
  String? _blurhash;
  String get blurhash => _blurhash ?? '';
  bool hasBlurhash() => _blurhash != null;

  void _initializeFields() {
    _menuNev = snapshotData['MenuNev'] as String?;
    _ar = castToType<double>(snapshotData['Ar']);
    _megjegyzes = snapshotData['Megjegyzes'] as String?;
    _menuPic = snapshotData['Menu_Pic'] as String?;
    _ajanlatok = getStructList(
      snapshotData['Ajanlatok'],
      AjanlatStruct.fromMap,
    );
    _avaiable = snapshotData['Avaiable'] as bool?;
    _blurhash = snapshotData['Blurhash'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Menu');

  static Stream<MenuRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuRecord.fromSnapshot(s));

  static Future<MenuRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuRecord.fromSnapshot(s));

  static MenuRecord fromSnapshot(DocumentSnapshot snapshot) => MenuRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuRecordData({
  String? menuNev,
  double? ar,
  String? megjegyzes,
  String? menuPic,
  bool? avaiable,
  String? blurhash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'MenuNev': menuNev,
      'Ar': ar,
      'Megjegyzes': megjegyzes,
      'Menu_Pic': menuPic,
      'Avaiable': avaiable,
      'Blurhash': blurhash,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuRecordDocumentEquality implements Equality<MenuRecord> {
  const MenuRecordDocumentEquality();

  @override
  bool equals(MenuRecord? e1, MenuRecord? e2) {
    const listEquality = ListEquality();
    return e1?.menuNev == e2?.menuNev &&
        e1?.ar == e2?.ar &&
        e1?.megjegyzes == e2?.megjegyzes &&
        e1?.menuPic == e2?.menuPic &&
        listEquality.equals(e1?.ajanlatok, e2?.ajanlatok) &&
        e1?.avaiable == e2?.avaiable &&
        e1?.blurhash == e2?.blurhash;
  }

  @override
  int hash(MenuRecord? e) => const ListEquality().hash([
        e?.menuNev,
        e?.ar,
        e?.megjegyzes,
        e?.menuPic,
        e?.ajanlatok,
        e?.avaiable,
        e?.blurhash
      ]);

  @override
  bool isValidKey(Object? o) => o is MenuRecord;
}
