import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'wallet_struct.g.dart';

abstract class WalletStruct
    implements Built<WalletStruct, WalletStructBuilder> {
  static Serializer<WalletStruct> get serializer => _$walletStructSerializer;

  String? get address;

  String? get privateKey;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(WalletStructBuilder builder) => builder
    ..address = ''
    ..privateKey = ''
    ..firestoreUtilData = FirestoreUtilData();

  WalletStruct._();
  factory WalletStruct([void Function(WalletStructBuilder) updates]) =
      _$WalletStruct;
}

WalletStruct createWalletStruct({
  String? address,
  String? privateKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WalletStruct(
      (w) => w
        ..address = address
        ..privateKey = privateKey
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

WalletStruct? updateWalletStruct(
  WalletStruct? wallet, {
  bool clearUnsetFields = true,
}) =>
    wallet != null
        ? (wallet.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addWalletStructData(
  Map<String, dynamic> firestoreData,
  WalletStruct? wallet,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (wallet == null) {
    return;
  }
  if (wallet.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && wallet.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final walletData = getWalletFirestoreData(wallet, forFieldValue);
  final nestedData = walletData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = wallet.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getWalletFirestoreData(
  WalletStruct? wallet, [
  bool forFieldValue = false,
]) {
  if (wallet == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(WalletStruct.serializer, wallet);

  // Add any Firestore field values
  wallet.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWalletListFirestoreData(
  List<WalletStruct>? wallets,
) =>
    wallets?.map((w) => getWalletFirestoreData(w, true)).toList() ?? [];
