// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abc_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AbcRecord> _$abcRecordSerializer = new _$AbcRecordSerializer();

class _$AbcRecordSerializer implements StructuredSerializer<AbcRecord> {
  @override
  final Iterable<Type> types = const [AbcRecord, _$AbcRecord];
  @override
  final String wireName = 'AbcRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AbcRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  AbcRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AbcRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$AbcRecord extends AbcRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? video;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AbcRecord([void Function(AbcRecordBuilder)? updates]) =>
      (new AbcRecordBuilder()..update(updates))._build();

  _$AbcRecord._({this.name, this.video, this.ffRef}) : super._();

  @override
  AbcRecord rebuild(void Function(AbcRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AbcRecordBuilder toBuilder() => new AbcRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AbcRecord &&
        name == other.name &&
        video == other.video &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), video.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AbcRecord')
          ..add('name', name)
          ..add('video', video)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AbcRecordBuilder implements Builder<AbcRecord, AbcRecordBuilder> {
  _$AbcRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _video;
  DocumentReference<Object?>? get video => _$this._video;
  set video(DocumentReference<Object?>? video) => _$this._video = video;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AbcRecordBuilder() {
    AbcRecord._initializeBuilder(this);
  }

  AbcRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _video = $v.video;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AbcRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AbcRecord;
  }

  @override
  void update(void Function(AbcRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AbcRecord build() => _build();

  _$AbcRecord _build() {
    final _$result =
        _$v ?? new _$AbcRecord._(name: name, video: video, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
