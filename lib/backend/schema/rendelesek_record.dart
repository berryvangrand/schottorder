import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class RendelesekRecord extends FirestoreRecord {
  RendelesekRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nev" field.
  String? _nev;
  String get nev => _nev ?? '';
  bool hasNev() => _nev != null;

  // "Telefonszam" field.
  String? _telefonszam;
  String get telefonszam => _telefonszam ?? '';
  bool hasTelefonszam() => _telefonszam != null;

  // "Darabszam" field.
  int? _darabszam;
  int get darabszam => _darabszam ?? 0;
  bool hasDarabszam() => _darabszam != null;

  // "Megjegyzes" field.
  String? _megjegyzes;
  String get megjegyzes => _megjegyzes ?? '';
  bool hasMegjegyzes() => _megjegyzes != null;

  // "RendelesDatuma" field.
  DateTime? _rendelesDatuma;
  DateTime? get rendelesDatuma => _rendelesDatuma;
  bool hasRendelesDatuma() => _rendelesDatuma != null;

  // "Rendelo" field.
  DocumentReference? _rendelo;
  DocumentReference? get rendelo => _rendelo;
  bool hasRendelo() => _rendelo != null;

  // "RendelesPrice" field.
  double? _rendelesPrice;
  double get rendelesPrice => _rendelesPrice ?? 0.0;
  bool hasRendelesPrice() => _rendelesPrice != null;

  // "RendelesID" field.
  String? _rendelesID;
  String get rendelesID => _rendelesID ?? '';
  bool hasRendelesID() => _rendelesID != null;

  // "Menutipus" field.
  String? _menutipus;
  String get menutipus => _menutipus ?? '';
  bool hasMenutipus() => _menutipus != null;

  void _initializeFields() {
    _nev = snapshotData['Nev'] as String?;
    _telefonszam = snapshotData['Telefonszam'] as String?;
    _darabszam = castToType<int>(snapshotData['Darabszam']);
    _megjegyzes = snapshotData['Megjegyzes'] as String?;
    _rendelesDatuma = snapshotData['RendelesDatuma'] as DateTime?;
    _rendelo = snapshotData['Rendelo'] as DocumentReference?;
    _rendelesPrice = castToType<double>(snapshotData['RendelesPrice']);
    _rendelesID = snapshotData['RendelesID'] as String?;
    _menutipus = snapshotData['Menutipus'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Rendelesek');

  static Stream<RendelesekRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RendelesekRecord.fromSnapshot(s));

  static Future<RendelesekRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RendelesekRecord.fromSnapshot(s));

  static RendelesekRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RendelesekRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RendelesekRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RendelesekRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RendelesekRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RendelesekRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRendelesekRecordData({
  String? nev,
  String? telefonszam,
  int? darabszam,
  String? megjegyzes,
  DateTime? rendelesDatuma,
  DocumentReference? rendelo,
  double? rendelesPrice,
  String? rendelesID,
  String? menutipus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nev': nev,
      'Telefonszam': telefonszam,
      'Darabszam': darabszam,
      'Megjegyzes': megjegyzes,
      'RendelesDatuma': rendelesDatuma,
      'Rendelo': rendelo,
      'RendelesPrice': rendelesPrice,
      'RendelesID': rendelesID,
      'Menutipus': menutipus,
    }.withoutNulls,
  );

  return firestoreData;
}

class RendelesekRecordDocumentEquality implements Equality<RendelesekRecord> {
  const RendelesekRecordDocumentEquality();

  @override
  bool equals(RendelesekRecord? e1, RendelesekRecord? e2) {
    return e1?.nev == e2?.nev &&
        e1?.telefonszam == e2?.telefonszam &&
        e1?.darabszam == e2?.darabszam &&
        e1?.megjegyzes == e2?.megjegyzes &&
        e1?.rendelesDatuma == e2?.rendelesDatuma &&
        e1?.rendelo == e2?.rendelo &&
        e1?.rendelesPrice == e2?.rendelesPrice &&
        e1?.rendelesID == e2?.rendelesID &&
        e1?.menutipus == e2?.menutipus;
  }

  @override
  int hash(RendelesekRecord? e) => const ListEquality().hash([
        e?.nev,
        e?.telefonszam,
        e?.darabszam,
        e?.megjegyzes,
        e?.rendelesDatuma,
        e?.rendelo,
        e?.rendelesPrice,
        e?.rendelesID,
        e?.menutipus
      ]);

  @override
  bool isValidKey(Object? o) => o is RendelesekRecord;
}
