import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DbComprasRecord extends FirestoreRecord {
  DbComprasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('db-compras');

  static Stream<DbComprasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DbComprasRecord.fromSnapshot(s));

  static Future<DbComprasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DbComprasRecord.fromSnapshot(s));

  static DbComprasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DbComprasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DbComprasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DbComprasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DbComprasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DbComprasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDbComprasRecordData({
  String? name,
  String? image,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class DbComprasRecordDocumentEquality implements Equality<DbComprasRecord> {
  const DbComprasRecordDocumentEquality();

  @override
  bool equals(DbComprasRecord? e1, DbComprasRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.description == e2?.description;
  }

  @override
  int hash(DbComprasRecord? e) =>
      const ListEquality().hash([e?.name, e?.image, e?.description]);

  @override
  bool isValidKey(Object? o) => o is DbComprasRecord;
}
