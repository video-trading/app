// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:cloud_functions/cloud_functions.dart';

Future updateOwner(DocumentReference videoId) async {
  // Add your function code here!
  await FirebaseFunctions.instance
      .httpsCallable("updateOwner")
      .call({"videoId": videoId.id});
}
