import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Role" field.
  Roles? _role;
  Roles? get role => _role;
  bool hasRole() => _role != null;

  // "Zip" field.
  int? _zip;
  int get zip => _zip ?? 0;
  bool hasZip() => _zip != null;

  // "Telepules" field.
  String? _telepules;
  String get telepules => _telepules ?? '';
  bool hasTelepules() => _telepules != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "OnboardingDone" field.
  bool? _onboardingDone;
  bool get onboardingDone => _onboardingDone ?? false;
  bool hasOnboardingDone() => _onboardingDone != null;

  // "Azonositoszam" field.
  int? _azonositoszam;
  int get azonositoszam => _azonositoszam ?? 0;
  bool hasAzonositoszam() => _azonositoszam != null;

  // "UserRole" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "isDebug" field.
  bool? _isDebug;
  bool get isDebug => _isDebug ?? false;
  bool hasIsDebug() => _isDebug != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = deserializeEnum<Roles>(snapshotData['Role']);
    _zip = castToType<int>(snapshotData['Zip']);
    _telepules = snapshotData['Telepules'] as String?;
    _address = snapshotData['Address'] as String?;
    _onboardingDone = snapshotData['OnboardingDone'] as bool?;
    _azonositoszam = castToType<int>(snapshotData['Azonositoszam']);
    _userRole = snapshotData['UserRole'] as String?;
    _isDebug = snapshotData['isDebug'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  Roles? role,
  int? zip,
  String? telepules,
  String? address,
  bool? onboardingDone,
  int? azonositoszam,
  String? userRole,
  bool? isDebug,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'Role': role,
      'Zip': zip,
      'Telepules': telepules,
      'Address': address,
      'OnboardingDone': onboardingDone,
      'Azonositoszam': azonositoszam,
      'UserRole': userRole,
      'isDebug': isDebug,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        e1?.zip == e2?.zip &&
        e1?.telepules == e2?.telepules &&
        e1?.address == e2?.address &&
        e1?.onboardingDone == e2?.onboardingDone &&
        e1?.azonositoszam == e2?.azonositoszam &&
        e1?.userRole == e2?.userRole &&
        e1?.isDebug == e2?.isDebug;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.role,
        e?.zip,
        e?.telepules,
        e?.address,
        e?.onboardingDone,
        e?.azonositoszam,
        e?.userRole,
        e?.isDebug
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
