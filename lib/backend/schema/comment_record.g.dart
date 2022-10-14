// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentRecord> _$commentRecordSerializer =
    new _$CommentRecordSerializer();

class _$CommentRecordSerializer implements StructuredSerializer<CommentRecord> {
  @override
  final Iterable<Type> types = const [CommentRecord, _$CommentRecord];
  @override
  final String wireName = 'CommentRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  CommentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$CommentRecord extends CommentRecord {
  @override
  final DocumentReference<Object?>? author;
  @override
  final DocumentReference<Object?>? video;
  @override
  final String? content;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommentRecord([void Function(CommentRecordBuilder)? updates]) =>
      (new CommentRecordBuilder()..update(updates))._build();

  _$CommentRecord._(
      {this.author, this.video, this.content, this.createdAt, this.ffRef})
      : super._();

  @override
  CommentRecord rebuild(void Function(CommentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentRecordBuilder toBuilder() => new CommentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentRecord &&
        author == other.author &&
        video == other.video &&
        content == other.content &&
        createdAt == other.createdAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, author.hashCode), video.hashCode), content.hashCode),
            createdAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentRecord')
          ..add('author', author)
          ..add('video', video)
          ..add('content', content)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommentRecordBuilder
    implements Builder<CommentRecord, CommentRecordBuilder> {
  _$CommentRecord? _$v;

  DocumentReference<Object?>? _author;
  DocumentReference<Object?>? get author => _$this._author;
  set author(DocumentReference<Object?>? author) => _$this._author = author;

  DocumentReference<Object?>? _video;
  DocumentReference<Object?>? get video => _$this._video;
  set video(DocumentReference<Object?>? video) => _$this._video = video;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CommentRecordBuilder() {
    CommentRecord._initializeBuilder(this);
  }

  CommentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _author = $v.author;
      _video = $v.video;
      _content = $v.content;
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentRecord;
  }

  @override
  void update(void Function(CommentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentRecord build() => _build();

  _$CommentRecord _build() {
    final _$result = _$v ??
        new _$CommentRecord._(
            author: author,
            video: video,
            content: content,
            createdAt: createdAt,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
