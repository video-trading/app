import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'abc_record.g.dart';

abstract class AbcRecord implements Built<AbcRecord, AbcRecordBuilder> {
  static Serializer<AbcRecord> get serializer => _$abcRecordSerializer;

  String? get name;

  DocumentReference? get video;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AbcRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ABC');

  static Stream<AbcRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AbcRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AbcRecord._();
  factory AbcRecord([void Function(AbcRecordBuilder) updates]) = _$AbcRecord;

  static AbcRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAbcRecordData({
  String? name,
  DocumentReference? video,
}) {
  final firestoreData = serializers.toFirestore(
    AbcRecord.serializer,
    AbcRecord(
      (a) => a
        ..name = name
        ..video = video,
    ),
  );

  return firestoreData;
}
