// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WalletStruct> _$walletStructSerializer =
    new _$WalletStructSerializer();

class _$WalletStructSerializer implements StructuredSerializer<WalletStruct> {
  @override
  final Iterable<Type> types = const [WalletStruct, _$WalletStruct];
  @override
  final String wireName = 'WalletStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, WalletStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.privateKey;
    if (value != null) {
      result
        ..add('privateKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  WalletStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WalletStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'privateKey':
          result.privateKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$WalletStruct extends WalletStruct {
  @override
  final String? address;
  @override
  final String? privateKey;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$WalletStruct([void Function(WalletStructBuilder)? updates]) =>
      (new WalletStructBuilder()..update(updates))._build();

  _$WalletStruct._(
      {this.address, this.privateKey, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'WalletStruct', 'firestoreUtilData');
  }

  @override
  WalletStruct rebuild(void Function(WalletStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WalletStructBuilder toBuilder() => new WalletStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WalletStruct &&
        address == other.address &&
        privateKey == other.privateKey &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, address.hashCode), privateKey.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WalletStruct')
          ..add('address', address)
          ..add('privateKey', privateKey)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class WalletStructBuilder
    implements Builder<WalletStruct, WalletStructBuilder> {
  _$WalletStruct? _$v;

  String? _address;
  String? get address => _$this._address;
  set address(String? address) => _$this._address = address;

  String? _privateKey;
  String? get privateKey => _$this._privateKey;
  set privateKey(String? privateKey) => _$this._privateKey = privateKey;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  WalletStructBuilder() {
    WalletStruct._initializeBuilder(this);
  }

  WalletStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address;
      _privateKey = $v.privateKey;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WalletStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WalletStruct;
  }

  @override
  void update(void Function(WalletStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WalletStruct build() => _build();

  _$WalletStruct _build() {
    final _$result = _$v ??
        new _$WalletStruct._(
            address: address,
            privateKey: privateKey,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'WalletStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
