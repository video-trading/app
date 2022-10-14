// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VideoRecord> _$videoRecordSerializer = new _$VideoRecordSerializer();

class _$VideoRecordSerializer implements StructuredSerializer<VideoRecord> {
  @override
  final Iterable<Type> types = const [VideoRecord, _$VideoRecord];
  @override
  final String wireName = 'VideoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, VideoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cover;
    if (value != null) {
      result
        ..add('cover')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  VideoRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VideoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cover':
          result.cover = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tags':
          result.tags.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$VideoRecord extends VideoRecord {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? author;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? likes;
  @override
  final String? cover;
  @override
  final String? video;
  @override
  final BuiltList<String>? tags;
  @override
  final double? price;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$VideoRecord([void Function(VideoRecordBuilder)? updates]) =>
      (new VideoRecordBuilder()..update(updates))._build();

  _$VideoRecord._(
      {this.title,
      this.description,
      this.author,
      this.createdAt,
      this.updatedAt,
      this.likes,
      this.cover,
      this.video,
      this.tags,
      this.price,
      this.ffRef})
      : super._();

  @override
  VideoRecord rebuild(void Function(VideoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VideoRecordBuilder toBuilder() => new VideoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VideoRecord &&
        title == other.title &&
        description == other.description &&
        author == other.author &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        likes == other.likes &&
        cover == other.cover &&
        video == other.video &&
        tags == other.tags &&
        price == other.price &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, title.hashCode),
                                            description.hashCode),
                                        author.hashCode),
                                    createdAt.hashCode),
                                updatedAt.hashCode),
                            likes.hashCode),
                        cover.hashCode),
                    video.hashCode),
                tags.hashCode),
            price.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VideoRecord')
          ..add('title', title)
          ..add('description', description)
          ..add('author', author)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('likes', likes)
          ..add('cover', cover)
          ..add('video', video)
          ..add('tags', tags)
          ..add('price', price)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class VideoRecordBuilder implements Builder<VideoRecord, VideoRecordBuilder> {
  _$VideoRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _author;
  DocumentReference<Object?>? get author => _$this._author;
  set author(DocumentReference<Object?>? author) => _$this._author = author;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  int? _likes;
  int? get likes => _$this._likes;
  set likes(int? likes) => _$this._likes = likes;

  String? _cover;
  String? get cover => _$this._cover;
  set cover(String? cover) => _$this._cover = cover;

  String? _video;
  String? get video => _$this._video;
  set video(String? video) => _$this._video = video;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  VideoRecordBuilder() {
    VideoRecord._initializeBuilder(this);
  }

  VideoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _author = $v.author;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _likes = $v.likes;
      _cover = $v.cover;
      _video = $v.video;
      _tags = $v.tags?.toBuilder();
      _price = $v.price;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VideoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VideoRecord;
  }

  @override
  void update(void Function(VideoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VideoRecord build() => _build();

  _$VideoRecord _build() {
    _$VideoRecord _$result;
    try {
      _$result = _$v ??
          new _$VideoRecord._(
              title: title,
              description: description,
              author: author,
              createdAt: createdAt,
              updatedAt: updatedAt,
              likes: likes,
              cover: cover,
              video: video,
              tags: _tags?.build(),
              price: price,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        _tags?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VideoRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
