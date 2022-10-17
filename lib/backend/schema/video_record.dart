import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'video_record.g.dart';

abstract class VideoRecord implements Built<VideoRecord, VideoRecordBuilder> {
  static Serializer<VideoRecord> get serializer => _$videoRecordSerializer;

  String? get title;

  String? get description;

  DocumentReference? get author;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'updated_at')
  DateTime? get updatedAt;

  int? get likes;

  String? get cover;

  String? get video;

  BuiltList<String>? get tags;

  double? get price;

  DocumentReference? get owner;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(VideoRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..likes = 0
    ..cover = ''
    ..video = ''
    ..tags = ListBuilder()
    ..price = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Video');

  static Stream<VideoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<VideoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static VideoRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => VideoRecord(
        (c) => c
          ..title = snapshot.data['title']
          ..description = snapshot.data['description']
          ..author = safeGet(() => toRef(snapshot.data['author']))
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..updatedAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['updated_at']))
          ..likes = snapshot.data['likes']?.round()
          ..cover = snapshot.data['cover']
          ..video = snapshot.data['video']
          ..tags = safeGet(() => ListBuilder(snapshot.data['tags']))
          ..price = snapshot.data['price']?.toDouble()
          ..owner = safeGet(() => toRef(snapshot.data['owner']))
          ..ffRef = VideoRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<VideoRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'Video',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  VideoRecord._();
  factory VideoRecord([void Function(VideoRecordBuilder) updates]) =
      _$VideoRecord;

  static VideoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createVideoRecordData({
  String? title,
  String? description,
  DocumentReference? author,
  DateTime? createdAt,
  DateTime? updatedAt,
  int? likes,
  String? cover,
  String? video,
  double? price,
  DocumentReference? owner,
}) {
  final firestoreData = serializers.toFirestore(
    VideoRecord.serializer,
    VideoRecord(
      (v) => v
        ..title = title
        ..description = description
        ..author = author
        ..createdAt = createdAt
        ..updatedAt = updatedAt
        ..likes = likes
        ..cover = cover
        ..video = video
        ..tags = null
        ..price = price
        ..owner = owner,
    ),
  );

  return firestoreData;
}
