import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comment_record.g.dart';

abstract class CommentRecord
    implements Built<CommentRecord, CommentRecordBuilder> {
  static Serializer<CommentRecord> get serializer => _$commentRecordSerializer;

  DocumentReference? get author;

  DocumentReference? get video;

  String? get content;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CommentRecordBuilder builder) =>
      builder..content = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Comment');

  static Stream<CommentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommentRecord._();
  factory CommentRecord([void Function(CommentRecordBuilder) updates]) =
      _$CommentRecord;

  static CommentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommentRecordData({
  DocumentReference? author,
  DocumentReference? video,
  String? content,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    CommentRecord.serializer,
    CommentRecord(
      (c) => c
        ..author = author
        ..video = video
        ..content = content
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
