import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transaction_record.g.dart';

abstract class TransactionRecord
    implements Built<TransactionRecord, TransactionRecordBuilder> {
  static Serializer<TransactionRecord> get serializer =>
      _$transactionRecordSerializer;

  String? get name;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  DocumentReference? get video;

  DocumentReference? get from;

  DocumentReference? get to;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TransactionRecordBuilder builder) => builder
    ..name = ''
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Transaction');

  static Stream<TransactionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TransactionRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TransactionRecord._();
  factory TransactionRecord([void Function(TransactionRecordBuilder) updates]) =
      _$TransactionRecord;

  static TransactionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTransactionRecordData({
  String? name,
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  DocumentReference? video,
  DocumentReference? from,
  DocumentReference? to,
}) {
  final firestoreData = serializers.toFirestore(
    TransactionRecord.serializer,
    TransactionRecord(
      (t) => t
        ..name = name
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..video = video
        ..from = from
        ..to = to,
    ),
  );

  return firestoreData;
}
