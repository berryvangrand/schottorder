import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AjanlatokRecord extends FirestoreRecord {
  AjanlatokRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Ajanlat_kep" field.
  String? _ajanlatKep;
  String get ajanlatKep => _ajanlatKep ?? '';
  bool hasAjanlatKep() => _ajanlatKep != null;

  // "Ajanlat_URL" field.
  String? _ajanlatURL;
  String get ajanlatURL => _ajanlatURL ?? '';
  bool hasAjanlatURL() => _ajanlatURL != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "Blurhash" field.
  String? _blurhash;
  String get blurhash => _blurhash ?? '';
  bool hasBlurhash() => _blurhash != null;

  void _initializeFields() {
    _ajanlatKep = snapshotData['Ajanlat_kep'] as String?;
    _ajanlatURL = snapshotData['Ajanlat_URL'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _blurhash = snapshotData['Blurhash'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ajanlatok');

  static Stream<AjanlatokRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AjanlatokRecord.fromSnapshot(s));

  static Future<AjanlatokRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AjanlatokRecord.fromSnapshot(s));

  static AjanlatokRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AjanlatokRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AjanlatokRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AjanlatokRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AjanlatokRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AjanlatokRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAjanlatokRecordData({
  String? ajanlatKep,
  String? ajanlatURL,
  int? order,
  String? blurhash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Ajanlat_kep': ajanlatKep,
      'Ajanlat_URL': ajanlatURL,
      'order': order,
      'Blurhash': blurhash,
    }.withoutNulls,
  );

  return firestoreData;
}

class AjanlatokRecordDocumentEquality implements Equality<AjanlatokRecord> {
  const AjanlatokRecordDocumentEquality();

  @override
  bool equals(AjanlatokRecord? e1, AjanlatokRecord? e2) {
    return e1?.ajanlatKep == e2?.ajanlatKep &&
        e1?.ajanlatURL == e2?.ajanlatURL &&
        e1?.order == e2?.order &&
        e1?.blurhash == e2?.blurhash;
  }

  @override
  int hash(AjanlatokRecord? e) => const ListEquality()
      .hash([e?.ajanlatKep, e?.ajanlatURL, e?.order, e?.blurhash]);

  @override
  bool isValidKey(Object? o) => o is AjanlatokRecord;
}
