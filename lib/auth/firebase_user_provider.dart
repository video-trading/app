import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class Video2TradeFirebaseUser {
  Video2TradeFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

Video2TradeFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Video2TradeFirebaseUser> video2TradeFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<Video2TradeFirebaseUser>(
      (user) {
        currentUser = Video2TradeFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
